class ChurchesController < ApplicationController
  load_and_authorize_resource class: 'Church'
  skip_before_action :authenticate_user!, only: [:index, :show]

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

  def edit
  end

  def update
    if @church.update_attributes(church_params)
      redirect_to churches_path, notice: "You have successfully updated #{@church.name}"
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
end
