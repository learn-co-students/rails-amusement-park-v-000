class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    ride = Ride.new
    ride.attraction = @attraction
    ride.user = @user
    ride.save
    complete_ride = ride.take_ride
    if complete_ride.is_a?(String)
      flash[:notice] = complete_ride
      redirect_to user_path(@user)
    else
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@user)
    end
  end
end
