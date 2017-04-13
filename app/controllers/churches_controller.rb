class ChurchesController < ApplicationController
  load_and_authorize_resource class: 'Church'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_church, only: [:rating, :ratings]

  def index
    @churches = Church.all
  end

  def new
    @church = Church.new
  end

  def create
    @church = Church.new(church_params)

    if @church.save
      redirect_to churches_path, notice: "You have successfully added #{@church.name}"
    else
      render :new
    end
  end

  def show
    @pastors = @church.pastors
  end

  def rating
  end

  def ratings
    answer_1 = params[:church][:answer_1].to_i
    answer_2 = params[:church][:answer_2].to_i
    answer_3 = params[:church][:answer_3].to_i

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @church.raters += 1

    ChurchUser.create(church: @church, user: current_user, rating: rating)
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
    redirect_to churches_path, notice: "You have deleted #{@church.name}"
  end

  private

  def church_params
    params.require(:church).permit(:name, :aka, :date_founded, :founder, :website, :avatar)
  end

  def rate_church
    @church = Church.find_by(id: params[:church_id])
  end
end
