class RidesController < ApplicationController
  
  def create
    @attraction = Attraction.find(ride_params[:attraction_id])
    @ride = Ride.new(:attraction_id => ride_params[:attraction_id], :user_id => current_user.id)
    
    if @ride.valid?
      redirect_to user_path(current_user), notice:@ride.take_ride
    else 
      redirect_to attraction_path(@attraction)
    end 
    
  end
  
   # ------------------------------PRIVATE METHODS BELOW ---------------------------------
  private
  
  def ride_params
    params.permit(:user_id, :attraction_id)
  end
  
end
