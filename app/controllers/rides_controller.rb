class RidesController < ApplicationController

  def new

  end

  def create
    @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])
    flash[:message] = @ride.take_ride
    @user = User.find(session[:user_id])
    redirect_to user_path(@user)
  end

end
