class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user = User.find(session[:user_id])
    # binding.pry

    @ride.attraction = Attraction.find(params[:attraction_id])
    @ride.save
    @user = @ride.user
    # @attraction = @ride.attraction
    

     redirect_to user_path(@user)
  end

end
