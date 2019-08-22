class RidesController < ApplicationController

    def create
        
        ride = Ride.create(ride_params)
        message = ride.take_ride
        #byebug
        redirect_to user_path(ride.user), flash: {alert: message}
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end 

end
