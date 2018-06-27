class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    if ride.save
      result = ride.take_ride
      if result
        flash[:alert] = result
      else
        flash[:alert] = "Thanks for riding the #{ride.attraction.name}!"
      end
    else
      flash[:alert] = "Ride unavailable."
    end
    redirect_to user_path(ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
