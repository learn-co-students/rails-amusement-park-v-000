  class RidesController < ApplicationController
  def create
    #binding.pry
    @ride = Ride.create(ride_params)
    @user = User.find(current_user.id)
    flash[:notice] = @ride.take_ride

    redirect_to user_path(@user)
  end

  private

  def ride_params
   params.require(:ride).permit(:attraction_id, :user_id)
  end
end
