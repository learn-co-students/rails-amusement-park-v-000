class RidesController < ApplicationController


  def create
    @ride = Ride.new
    @ride.user = User.find(session[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])
    if @ride.take_ride.is_a?(String)
      flash[:message] = @ride.take_ride
    else
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
    end 
    redirect_to user_path(@ride.user)
  end

end
