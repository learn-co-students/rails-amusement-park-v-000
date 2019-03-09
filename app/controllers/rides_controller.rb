class RidesController < ApplicationController


  def create
    @ride = Ride.create(ride_params)
  end

  private

  def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
  end


  end
