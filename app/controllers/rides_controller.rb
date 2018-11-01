class RidesController < ApplicationController
    skip_before_action :verify_authenticity_token

   def new
    
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    # we want to add the take a ride logic here.
    @ride.take_ride
    redirect_to user_path(@ride.user) # this should feed into user id with an updated ticekts and stuff.
   end
   
   
  
  
end
