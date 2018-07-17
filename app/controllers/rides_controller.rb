class RidesController < ApplicationController

  def show
  end

  def new
    @ride = Ride.new(attraction_id: params[:id])
  end

  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: session[:attraction_id])
    #@attraction = User.find_by_id(params[:id])
    #@user = User.find_by_id(session[:user_id])
    #@user.tickets = @user.tickets - @attraction.tickets
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
