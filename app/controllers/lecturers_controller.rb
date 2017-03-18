class LecturersController < ApplicationController
  load_and_authorize_resource class: 'Lecturer'
  before_action :find_school

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

  def destroy
    @lecturer.destroy
    redirect_to school_path(@school), notice: "You have deleted #{@lecturer.name}"
  end

  private

  def lecturer_params
    params.require(:lecturer).permit(:name, :course, :avatar)
  end

  def find_school
    @school = School.find_by(id: params[:school_id])
  end
end
