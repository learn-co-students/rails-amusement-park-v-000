class RidesController < ApplicationController
    def create
        # @ride = Ride.create(
        #     user_id: params[:user_id],
        #     attraction_id: params[:attraction_id]
        # )
        @ride = Ride.new(ride_params)
        @ride.save

        message = @ride.take_ride
        flash[:message] = message
        redirect_to user_path(@user)
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
