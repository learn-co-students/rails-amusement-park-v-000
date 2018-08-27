class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    @ride.save

    flash[:notice] = @ride.take_ride

    redirect_to @ride.user
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
