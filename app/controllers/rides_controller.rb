class RidesController < ApplicationController

  def show
  end

  def new
  end

  def create
    Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.find_by_id(params[:id])
    flash[:ride_success] = "Thanks for riding !"
    redirect_to user_path(@user)
  end
end
