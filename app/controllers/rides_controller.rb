class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)
    @user = User.find(current_user)
    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
