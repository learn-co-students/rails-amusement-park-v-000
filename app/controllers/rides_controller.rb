class RidesController < ApplicationController

  def create
    @user = User.find(current_user)
    @attraction = Attraction.find(params[:attraction][:attraction_id])
    @ride = Ride.new
    @ride.user = @user
    @ride.attraction = @attraction
    if @ride.save
      flash[:message] = @ride.take_ride
      redirect_to user_path(@ride.user)
    end
  end

end
