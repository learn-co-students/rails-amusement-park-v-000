class RidesController < ApplicationController

  def create

    ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
    session[:error] = ride.take_ride
    redirect_to user_path(current_user)
  end


end
