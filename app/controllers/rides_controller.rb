class RidesController < ApplicationController
	
  def new
    # binding.pry

  	@ride = Ride.new(
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
      )
    @ride.save
  	@message = @ride.take_ride
  	redirect_to user_path(@ride.user, :message => @message)
  end

  private

  def ride_params
  	params.require(:ride).permit(:user_id, :attraction_id)
  end

end
