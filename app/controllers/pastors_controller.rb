class PastorsController < ApplicationController
  load_and_authorize_resource class: 'Pastor'
  before_action :find_church

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
end
