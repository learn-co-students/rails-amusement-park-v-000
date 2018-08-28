class RidesController < ApplicationController
  def create
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
    @ride.take_ride
    redirect_to user_path(@ride.user_id)
  end
end
