class RidesController < ApplicationController
  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
