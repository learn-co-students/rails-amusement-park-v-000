class RideController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @user = User.find(params[:ride][:user_id])
    @ride = Ride.create(ride_params)
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@user)
  end

  private
    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end

end
