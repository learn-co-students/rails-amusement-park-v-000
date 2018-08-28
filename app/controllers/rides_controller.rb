class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user = current_user
    @ride.attraction = Attraction.find(params[:attraction_id])


    redirect_to user_path(current_user), notice: @ride.take_ride
  end

end
