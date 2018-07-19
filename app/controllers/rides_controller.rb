class RidesController < ApplicationController
  def ride
    user = User.find_by(id: session[:user_id])
    attraction = Attraction.find_by(id: params[:attraction])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
    flash[:alert] = ride.take_ride
    redirect_to user_path(user)
  end
end