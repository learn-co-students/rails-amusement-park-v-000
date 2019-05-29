class RidesController < ApplicationController
  def create
    @ride = Ride.new
    @user = User.find(current_user)
    @ride.take_ride
  end
end
