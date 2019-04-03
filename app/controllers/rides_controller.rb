class RidesController < ApplicationController

    def create
        @ride = Ride.new(ride_params)
        if @ride.save
            @message =  @ride.take_ride
            redirect_to user_path(@ride.user, message: @message)
        end
    end

    private
    def ride_params 
        params.require(:ride).permit(
            :user_id,
            :attraction_id
        )
    end 
 end