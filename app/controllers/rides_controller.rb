class RidesController < ApplicationController

  def go
    # raise session.inspect
    ride = Ride.create(attraction_id: session[:attraction_id], user_id: session[:user_id])

    user = User.find_by(id: session[:user_id])

     # attraction = Attraction.find(session[:attraction_id])
    # ride.take_ride

    flash[:notice] = ride.take_ride
    redirect_to user_path(user)
  end

end
