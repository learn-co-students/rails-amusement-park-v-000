class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end
    def create
        @ride = Ride.new(ride_params)
        @ride.user = current_user
        if @ride.save
            @ride.take_ride
            redirect_to current_user, alert: @ride.message
        else
            redirect_to current_user
        end
    end
    def show
        @ride = Ride.find_by(id: params[:id])
        raise @ride.inspect
        @ride.take_ride
        redirect_to current_user
    end
    private
    def ride_params
        params.require(:ride).permit(:attraction_id)
    end
end