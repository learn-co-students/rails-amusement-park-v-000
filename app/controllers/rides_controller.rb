class RidesController < ApplicationController
  before_action :require_login
  def create
    @user = current_user
    params[:ride][:user_id] = @user.id

    @ride = Ride.new(ride_params)
    @attraction = Attraction.find_by(id: ride_params[:attraction_id])

    if @ride.save && @user.tickets && @user.happiness && @user.nausea
      flash[:message] = @ride.take_ride
    end

    redirect_to user_path(@user)
  end
    
    
    
  private
    
  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end

end