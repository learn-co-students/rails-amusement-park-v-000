class RidesController < ApplicationController

  def create
    @ride = Ride.create(ride_params)
    # @user = User.find_by(id: @ride.user_id)
    #
    # @user # update nausea, happiness, and tickets using the attractions data
    @ride.take_ride

    redirect_to user_path(@ride.user_id)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
