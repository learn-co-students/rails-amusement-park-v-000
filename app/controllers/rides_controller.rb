class RidesController < ApplicationController
  def create
    @ride = Ride.create(@ride.attraction)
    @user = User.find(current_user)
    @ride.take_ride
  end
end
