class LecturersController < ApplicationController
  load_and_authorize_resource class: 'Lecturer'
  before_action :find_school
  before_action :rate_lecturer, only: [:rating, :ratings]

  def new
    @lecturer = @school.lecturers.new
  end

  def create
    @lecturer = @school.lecturers.new(lecturer_params)

    if @lecturer.save
      redirect_to school_path(@school), notice: "You have successfully added #{@lecturer.name}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lecturer.update_attributes(lecturer_params)
      redirect_to school_path(@school), notice: "You have successfully updated #{@lecturer.name}"
    else
      render :edit
    end
  end

  def rating
    @tags = LecturerTag.all
  end

  def ratings
    answer_1 = params[:lecturer][:answer_1].to_i
    answer_2 = params[:lecturer][:answer_2].to_i
    answer_3 = params[:lecturer][:answer_3].to_i

    extra_comment = params[:lecturer][:extra_comment]
    tags = params[:lecturer][:tag]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @lecturer.raters += 1

    @lecturer.tag = if @lecturer.tag.nil?
                      tags
                    elsif tags.present?
                      @lecturer.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',').concat(tags)
                    else
                      @lecturer.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',')
                    end

    LecturerUser.create(lecturer: @lecturer, user: current_user, rating: rating, extra_comment: extra_comment)
    total_ratings = LecturerUser.sum(:rating).to_f
    @lecturer.rating = (total_ratings / @lecturer.raters)

    if @lecturer.save
      redirect_to school_path(@school)
    else
      render :rating
    end
  end

  def destroy
    @lecturer.destroy
    redirect_to school_path(@school), notice: 'Successfully deleted'
  end

  private

  def lecturer_params
    params.require(:lecturer).permit(:name, :course, :avatar, tag: [])
  end

  def find_school
    @school = School.find_by(id: params[:school_id])
  end

  def rate_lecturer
    @lecturer = Lecturer.find_by(id: params[:lecturer_id])
  end
end
