class RidesController < ApplicationController
   
 def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
 end

end
