class RidesController < ApplicationController
    def create
        @ride = Ride.create(ride_params)
        
        redirect_to user_path(@ride.user_id), alert: "#{@ride.take_ride}"
    end

    private

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end    
end
