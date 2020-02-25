class AttractionsController < ApplicationController

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
end
