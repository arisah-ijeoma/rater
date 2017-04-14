class SchoolsController < ApplicationController
  load_and_authorize_resource class: 'School'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_school, only: [:rating, :ratings]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: "You have successfully added #{@school.name}"
    else
      render :new
    end
  end

  def show
    @lecturers = @school.lecturers
    @ratings = SchoolUser.all
  end

  def edit
  end

  def update
    if @school.update_attributes(school_params)
      redirect_to school_path(@school), notice: "You have successfully updated #{@school.name}"
    else
      render :edit
    end
  end

  def rating
  end

  def ratings
    answer_1 = params[:school][:answer_1].to_i
    answer_2 = params[:school][:answer_2].to_i
    answer_3 = params[:school][:answer_3].to_i

    extra_comment = params[:school][:extra_comment]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @school.raters += 1

    SchoolUser.create(school: @school, user: current_user, rating: rating, extra_comment: extra_comment)
        total_ratings = SchoolUser.sum(:rating).to_f
        @school.rating = (total_ratings / @school.raters)

    if @school.save
      redirect_to school_path(@school)
    else
      render :rating
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path, notice: "You have deleted #{@school.name}"
  end

  private

  def school_params
    params.require(:school).permit(:name, :aka, :date_founded, :location, :ownership, :category, :head, :website, :avatar)
  end

  def rate_school
    @school = School.find_by(id: params[:school_id])
  end
end
