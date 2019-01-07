class RidesController < ApplicationController
  def create
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    error = ride.take_ride
    flash[:error] = error if error.start_with?("Sorry.")
    redirect_to user_path(params[:user_id])
  end
end
