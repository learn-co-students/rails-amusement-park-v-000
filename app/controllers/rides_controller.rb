class RidesController < ApplicationController
  def create
    @user = User.find(current_user)
    @ride = Ride.create(ride_params)
    flash[:notice] = @ride.take_ride
    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
