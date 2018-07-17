class RidesController < ApplicationController

  def show
  end

  def new
    @ride = Ride.create(attraction_id: params[:id])
    binding.pry
  end

  def create
    @ride = Ride.user(user_id: session[:user_id])
    @attraction = User.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    flash[:ride_success] = "Thanks for riding #{@attraction.name}!"
    @user.tickets = @user.tickets - @attraction.tickets
    redirect_to user_path(@user)
  end
end
