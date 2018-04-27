class RidesController < ApplicationController
    before_action :current_user
  def new
   @ride = Ride.new
  end
  
  def create
     @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
     # @user = @ride.user
     @message = @ride.take_ride
    redirect_to user_path(@ride.user)
  end
private

# def set_ride
#     @ride = Ride.find(params[:id])
# end

def ride_params
params.require(:ride).permit(:user_id, :attraction_id)
end
end
