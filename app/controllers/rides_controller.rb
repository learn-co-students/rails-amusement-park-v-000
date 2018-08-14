class RidesController < ApplicationController

  def create
    binding.pry
    @ride = Ride.create(ride_params)
    @ride.save
    @ride.take_ride
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
