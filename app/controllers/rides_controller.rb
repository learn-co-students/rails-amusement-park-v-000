class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.save
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end

end
