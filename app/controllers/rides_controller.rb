class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    if ride.save
      flash[:notice] = ride.take_ride
      redirect_to user_path(current_user)
    else
      redirect_to attraction_path(ride.attraction_id)
    end
  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
