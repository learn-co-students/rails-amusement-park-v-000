class RidesController < ApplicationController
  def new
  end

  def create
    @ride = Ride.create(ride_params)
    @ride.take_ride
    flash[:alert] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  def delete
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
