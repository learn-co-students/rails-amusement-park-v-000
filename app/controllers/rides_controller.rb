class RidesController < ApplicationController
  def new
    # binding.pry
    @ride = Ride.new
    # @ride = Ride.create(:user_id => params[:ride][:user_id], :attraction_id => params[:ride][:attraction_id])
    # @user = User.find_by(id: params[:id])
  #   @ride.take_ride
  end
  def create
    
    
    @ride = Ride.create(:user_id => session[:user_id], :attraction_id => params[:id])
    #  binding.pry
    @ride.take_ride
   
  end
end