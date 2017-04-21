class SchoolsController < ApplicationController
  load_and_authorize_resource class: 'School'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_school, only: [:rate, :rating]

  def index
    @schools = School.all.paginate(page: params[:page], per_page: 7)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      User.all.each do |user|
        UserMailer.new_addition(user, @school).deliver_now
      end
      redirect_to schools_path, notice: "You have successfully added #{@school.name}"
    else
      render :new
    end
  end

  def show
    @lecturers = @school.lecturers
    @ratings = SchoolUser.rating(@school)
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

  def rate
    @tags = SchoolTag.all
  end

  def rating
    answer_1 = params[:school][:answer_1].to_i
    answer_2 = params[:school][:answer_2].to_i
    answer_3 = params[:school][:answer_3].to_i

    extra_comment = params[:school][:extra_comment]
    tags = params[:school][:tag]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @school.raters += 1

    @school.tag = if @school.tag.nil?
                    tags
                  elsif tags.present?
                    @school.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',').concat(tags)
                  else
                    @school.tag.gsub(/[^A-Za-z|,|]/, ' ').split(',')
                  end

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
    redirect_to schools_path, notice: 'Successfully deleted'
  end

  private

  def school_params
    params.require(:school).permit(:name,
                                   :aka,
                                   :date_founded,
                                   :location,
                                   :ownership,
                                   :category,
                                   :head,
                                   :website,
                                   :avatar,
                                   tag: [])
  end

  def rate_school
    @school = School.find_by(id: params[:school_id])
  end
end
