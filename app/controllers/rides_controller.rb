class RidesController < ApplicationController
    def create
        p = ride_params()
        @ride = Ride.new(p)
        msg = @ride.take_ride

        @ride.save
            flash[:notice] = msg
            redirect_to user_path(p[:user_id])

        # if msg.include?("Sorry")
        #     flash[:error] = msg
        #     redirect_to attraction_path(p[:attraction_id])
        # else 
        #     @ride.save
        #     flash[:notice] = msg
        #     redirect_to user_path(p[:user_id])
        # end
    end

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end