class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]

  def new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction.id)
  end

  def index
    @attractions = Attraction.all
    find_user
  end

  def show
    find_user
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction.id)
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
