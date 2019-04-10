class RidesController < ApplicationController
	before_action :require_login

  def create
    ride = Ride.create(ride_params)
    if ride   
      flash[:notice] = ride.take_ride
      redirect_to user_path(ride.user)
    else
      redirect_to attraction_path(ride.attraction)
    end
  end

  private

  def ride_params
      params.permit(:user_id, :attraction_id)
  end
  
end
