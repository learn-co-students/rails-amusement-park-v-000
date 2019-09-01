class RidesController < ApplicationController

  def create
    ride = Ride.new(ride_params)
    if ride.user.tickets >= ride.attraction.tickets && ride.user.height >= ride.attraction.min_height
      ride.save
      flash[:notice] = ride.take_ride
    else
      flash[:notice] = ride.take_ride
    end
    redirect_to user_path(current_user)
  end


  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
