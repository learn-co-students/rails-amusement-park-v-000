class RidesController < ApplicationController
  def create
    ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    error = ride.take_ride
    error.start_with?("Sorry.") ? flash[:error] = error : flash[:success] = 
    "Thanks for riding the #{ride.attraction.name}!"
    redirect_to user_path(params[:user_id])
  end
end
