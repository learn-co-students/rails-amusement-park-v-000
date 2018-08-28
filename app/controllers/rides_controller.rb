class RidesController < ApplicationController

  def new
    @ride = Ride.new
    @ride.user = current_user
    @ride.take_ride
    @ride.save

    redirect_to user_path(current_user)
  end

end
