class ChurchesController < ApplicationController
  load_and_authorize_resource class: 'Church'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_church, only: [:rate, :rating]

  def index
    @churches = Church.all.paginate(page: params[:page], per_page: 7)
  end

  def new
    @church = Church.new
  end

  def create
    @church = Church.new(church_params)

    if @church.save
      User.all.each do |user|
        UserMailer.new_addition(user, @church).deliver_now
      end
      redirect_to churches_path, notice: "You have successfully added #{@church.name}"
    else
      render :new
    end
  end

  def show
    @pastors = @church.pastors
    @ratings = ChurchUser.rating(@church)
  end

  def rate
    @tags = ChurchTag.all
  end

  def rating
    answer_1 = params[:church][:answer_1].to_i
    answer_2 = params[:church][:answer_2].to_i
    answer_3 = params[:church][:answer_3].to_i

    extra_comment = params[:church][:extra_comment]
    tags = params[:church][:tag]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @church.raters += 1

    @church.tag = if @church.tag.nil?
                    tags
                  elsif tags.present?
                    @church.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',').concat(tags)
                  else
                    @church.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',')
                  end

    ChurchUser.create(church: @church, user: current_user, rating: rating, extra_comment: extra_comment)
    total_ratings = ChurchUser.sum(:rating).to_f
    @church.rating = (total_ratings / @church.raters)

    if @church.save
      redirect_to church_path(@church)
    else
      render :rating
    end
  end

  def edit
  end

  def update
    if @church.update_attributes(church_params)
      redirect_to church_path(@church), notice: "You have successfully updated #{@church.name}"
    else
      render :edit
    end
  end

  def destroy
    @church.destroy
    redirect_to churches_path, notice: 'Successfully deleted'
  end

  private

  def church_params
    params.require(:church).permit(:name, :aka, :date_founded, :founder, :website, :avatar, tag: [])
  end

  def rate_church
    @church = Church.find_by(id: params[:church_id])
  end
end
