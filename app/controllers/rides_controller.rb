class RidesController < ApplicationController
  def new
    ride = Ride.create(:user_id => session[:user_id], :attraction_id => params[:attraction_id])
    # binding.pry
    @message = ride.take_ride
    redirect_to user_path(ride.user, :message => @message)
  end
end
