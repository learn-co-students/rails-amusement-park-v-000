class RidesController < ApplicationController
	
  def new
    # binding.pry

  	@ride = Ride.create(
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
      )
    
  	@message = @ride.take_ride
  	redirect_to user_path(@ride.user, :message => @message)
  end

  private

  def ride_params
  	params.require(:ride).permit(:user_id, :attraction_id)
  end

end
