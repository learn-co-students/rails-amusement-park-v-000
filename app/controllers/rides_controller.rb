class RidesController < ApplicationController

    def create
        @ride = Ride.includes(:attraction).create(

          :user_id => params[:user_id],
          :attraction_id => params[:attraction_id]
        )
      
        @message = @ride.take_ride
        redirect_to user_path(@ride.user, :message => @message)
    end


end
