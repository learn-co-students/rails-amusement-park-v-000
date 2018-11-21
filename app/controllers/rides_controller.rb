class RidesController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    message = @ride.take_ride
    if message != true
      flash[:error] = message
    else
      flash[:success] = "Thanks for riding the #{current_user.rides.last.attraction.name}!"
    end
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end


end
