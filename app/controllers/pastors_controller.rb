class PastorsController < ApplicationController
  load_and_authorize_resource class: 'Pastor'
  before_action :find_church
  before_action :rate_pastor, only: [:rating, :ratings]

  def new
    @pastor = @church.pastors.new
  end

  def create
    @pastor = @church.pastors.new(pastor_params)

    if @pastor.save
      redirect_to church_path(@church), notice: "You have successfully added #{@pastor.name}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pastor.update_attributes(pastor_params)
      redirect_to church_path(@church), notice: "You have successfully updated #{@pastor.name}"
    else
      render :edit
    end
  end

  def rating
  end

  def ratings
    answer_1 = params[:pastor][:answer_1].to_i
    answer_2 = params[:pastor][:answer_2].to_i
    answer_3 = params[:pastor][:answer_3].to_i

    extra_comment = params[:pastor][:extra_comment]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @pastor.raters += 1

    PastorUser.create(pastor: @pastor, user: current_user, rating: rating, extra_comment: extra_comment)
    total_ratings = PastorUser.sum(:rating).to_f
    @pastor.rating = (total_ratings / @pastor.raters)

    if @pastor.save
      redirect_to church_path(@church)
    else
      render :rating
    end
  end

  def destroy
    @pastor.destroy
    redirect_to church_path(@church), notice: "You have deleted #{@pastor.name}"
  end

  private

  def pastor_params
    params.require(:pastor).permit(:name, :avatar)
  end

  def find_church
    @church = Church.find_by(id: params[:church_id])
  end

  def rate_pastor
    @pastor = Pastor.find_by(id: params[:pastor_id])
  end
end
