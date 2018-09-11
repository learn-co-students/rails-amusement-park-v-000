class RidesController < ApplicationController

  def create
    @ride = Ride.create(ride_params)
    @user = User.find(@ride.user_id)
    @attraction = Attraction.find(@ride.attraction_id)

    @message = @ride.take_ride
    redirect_to user_path(@ride.user)
    flash[:notice] = @message
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
