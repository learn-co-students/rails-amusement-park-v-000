class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
    @alert = @ride.take_ride
    redirect_to user_path(@ride.user), alert: @alert
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
