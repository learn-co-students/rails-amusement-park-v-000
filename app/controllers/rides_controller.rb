class RidesController < ApplicationController
  def new
    @ride = Ride.new
    # @user = User.find_by(id: params[:id])
    @ride.take_ride
  end
end