class RidesController < ApplicationController

  # GET /rides
  def new

  end

  # POST /rides
  def create
    ride = Ride.create(ride_params)
    flash[:notice] = ride.take_ride
    redirect_to user_path(ride.user_id)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
