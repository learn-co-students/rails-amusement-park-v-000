class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    if @ride.has_errors?
      flash[:message] = @ride.error
    else
      @ride.take_ride
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(current_user)

  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id).merge({user_id: current_user})
  end
end
