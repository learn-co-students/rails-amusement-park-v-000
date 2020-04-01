class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def take_ride
    ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)  
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def update
    @attraction = Attraction.find_by(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
