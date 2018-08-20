class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    find_attraction
  end

  def update
    find_attraction
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
  end

  def show
    find_attraction
    @user = current_user
    @ride = Ride.new
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
