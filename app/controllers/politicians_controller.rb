class PoliticiansController < ApplicationController
  load_and_authorize_resource class: 'Politician'
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @politicians = Politician.all
  end

  def new
    @politician = Politician.new
  end

  def create
    @politician = Politician.new(politician_params)

    if @politician.save
      redirect_to politicians_path, notice: "You have successfully added #{@politician.name}"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @politician.update_attributes(politician_params)
      redirect_to politician_path(@politician), notice: "You have successfully updated #{@politician.name}"
    else
      render :edit
    end
  end

  def destroy
    @politician.destroy
    redirect_to politicians_path, notice: "You have deleted #{@politician.name}"
  end

  private

  def politician_params
    params.require(:politician).permit(:name, :current_office, :date_assumed, :present_party, :former_position, :avatar)
  end
end
