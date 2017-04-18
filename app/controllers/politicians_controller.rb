class PoliticiansController < ApplicationController
  load_and_authorize_resource class: 'Politician'
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :rate_politician, only: [:rating, :ratings]

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
    @ratings = PoliticianUser.all
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

  def rating
  end

  def ratings
    answer_1 = params[:politician][:answer_1].to_i
    answer_2 = params[:politician][:answer_2].to_i
    answer_3 = params[:politician][:answer_3].to_i

    extra_comment = params[:politician][:extra_comment]

    answer = answer_1 + answer_2 + answer_3
    rating = (answer.to_f/9) * 5

    @politician.raters += 1

    PoliticianUser.create(politician: @politician, user: current_user, rating: rating, extra_comment: extra_comment)
    total_ratings = PoliticianUser.sum(:rating).to_f
    @politician.rating = (total_ratings / @politician.raters)

    if @politician.save
      redirect_to politician_path(@politician)
    else
      render :rating
    end
  end

  def destroy
    @politician.destroy
    redirect_to politicians_path, notice: 'Successfuly deleted'
  end

  private

  def politician_params
    params.require(:politician).permit(:name, :current_office, :date_assumed, :present_party, :former_position, :avatar)
  end

  def rate_politician
    @politician = Politician.find_by(id: params[:politician_id])
  end
end
