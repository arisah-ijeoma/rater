class BrandsController < ApplicationController
  load_and_authorize_resource class: 'Brand'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_brand, only: [:rating, :ratings]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to brands_path, notice: "You have successfully added #{@brand.name}"
    else
      render :new
    end
  end

  def show
    @ratings = BrandUser.rating(@brand)
  end

  def edit
  end

  def update
    if @brand.update_attributes(brand_params)
      redirect_to brand_path(@brand), notice: "You have successfully updated #{@brand.name}"
    else
      render :edit
    end
  end

  def rating
    @tags = BrandTag.all
  end

  def ratings
    answer_1 = params[:brand][:answer_1].to_i
    answer_2 = params[:brand][:answer_2].to_i
    answer_3 = params[:brand][:answer_3].to_i

    extra_comment = params[:brand][:extra_comment]
    tags = params[:brand][:tag]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @brand.raters += 1

    @brand.tag =  if @brand.tag.nil?
                    tags
                  elsif tags.present?
                    @brand.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',').concat(tags)
                  else
                    @brand.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',')
                  end

    BrandUser.create(brand: @brand, user: current_user, rating: rating, extra_comment: extra_comment)
    total_ratings = BrandUser.sum(:rating).to_f
    @brand.rating = (total_ratings / @brand.raters)

    if @brand.save
      redirect_to brand_path(@brand)
    else
      render :rating
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_path, notice: 'Successfully deleted'
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :managed_by, :industry, :avatar, tag: [])
  end

  def rate_brand
    @brand = Brand.find_by(id: params[:brand_id])
  end
end
