class RidesController < ApplicationController
  def create
    ride = Ride.create(:user_id => params[:ride][:user_id], :attraction_id => params[:ride][:attraction_id])
    user = User.find_by_id(params[:ride][:user_id])
    flash[:notice] = ride.take_ride
    redirect_to user_path(user)
  end
end
