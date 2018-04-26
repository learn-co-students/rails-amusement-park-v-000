class RidesController < ApplicationController
  def new
  end

  def create
    @ride = Ride.new(ride_params)
    @notice = @ride.take_ride
    @ride.save
    redirect_to user_path(@ride.user), notice: @notice
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end