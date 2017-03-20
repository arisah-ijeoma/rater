class BrandsController < ApplicationController
  load_and_authorize_resource class: 'Brand'
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def destroy
    @brand.destroy
    redirect_to brands_path, notice: "You have deleted #{@brand.name}"
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :managed_by, :industry, :avatar)
  end
end
