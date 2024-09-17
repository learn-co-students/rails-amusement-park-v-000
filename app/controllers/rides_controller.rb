class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(rides_params)
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private
  def rides_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
