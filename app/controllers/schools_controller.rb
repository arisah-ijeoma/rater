class SchoolsController < ApplicationController
  load_and_authorize_resource class: 'School'
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def destroy
    @school.destroy
    redirect_to schools_path, notice: "You have deleted #{@school.name}"
  end

  private

  def school_params
    params.require(:school).permit(:name, :aka, :date_founded, :location, :ownership, :category, :head, :website, :avatar)
  end
end
