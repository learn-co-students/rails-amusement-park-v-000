class RidesController < ApplicationController

  def create
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction_id])
    ride.take_ride
    flash[:notice] = ride.take_ride
    redirect_to user_path(ride.user)
  end
end
