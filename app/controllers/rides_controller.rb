class RidesController < ApplicationController
  def update
    @ride = Ride.create(attraction: Attraction.find(params[:id]), user: current_user)
    message = @ride.take_ride
    flash[:notice] = message
    redirect_to user_path(@ride.user)
  end
end
