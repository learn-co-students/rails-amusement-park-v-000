class RidesController < ApplicationController
  # def new
  #   @ride = Ride.new
  # end
  def create
    @ride = Ride.create(:user_id => session[:user_id], :attraction_id => params[:id])
    #  binding.pry
    status = @ride.take_ride
    if status === true
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    else
      flash[:notice] = status
    end
   redirect_to user_path(current_user)
  end
end