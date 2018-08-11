class RidesController < ApplicationController

  def index
  end

  def show
  end

  def create
    @ride = Ride.create(
      :user_id => params[:user_id],
      :attraction_id => params[:attraction_id]
    )
    @message = @ride.take_ride
    redirect_to user_path(current_user, message: @message)
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
