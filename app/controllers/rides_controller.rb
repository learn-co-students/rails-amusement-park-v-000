class RidesController < ApplicationController

  def new
  end

  def create
    ride = Ride.create(attraction_id: params[:attraction_id], user_id: current_user.id)
    if ride
      response = ride.take_ride
      flash[:notice] = response
      redirect_to user_path(ride.user)
    end
  end


end
