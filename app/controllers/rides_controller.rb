class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)
    @user = User.find(current_user)
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @user.ticket_count(@attraction)
    @user.mood_change
    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
