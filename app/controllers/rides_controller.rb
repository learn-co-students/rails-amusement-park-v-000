class RidesController < ApplicationController
  before_action :require_logged_in

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to user_path(@user), flash: { message:message }
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
