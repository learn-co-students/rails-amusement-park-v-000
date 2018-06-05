class RidesController < ApplicationController
	
  def new
  	@ride = Ride.create(ride_params)
  	@message = @ride.take_ride
  	redirect_to user_path(@ride.user, :message => @message)
  end

  private

  def ride_params
  	params.require(:ride).permit(:user_id, :attraction_id)
  end

end
