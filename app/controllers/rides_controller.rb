class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride_message = @ride.take_ride
    flash[:notice] = @ride_message 
    redirect_to user_path(@ride.user_id)
  end
end
