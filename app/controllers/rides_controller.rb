class RidesController < ApplicationController

  def new
  end

  def create
    ride = Ride.new(ride_params)

    ride.take_ride


    redirect_to @current_user, notice:  ride.display_message
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
