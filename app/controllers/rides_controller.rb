class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user = current_user
    binding.pry
    @ride.attraction
    @ride.take_ride
    @ride.save

    redirect_to user_path(current_user)
  end

end
