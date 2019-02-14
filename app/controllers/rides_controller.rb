class RidesController < ApplicationController

    def new 
        # binding.pry
        ride = Ride.create(
            :user_id => params[:current_user],
            :attraction_id => params[:@attraction]
        )
        
        
        @message = ride.take_ride || "agoiheawoi"

        redirect_to user_path(current_user, :message => @message)
    end 

end
