class RidesController < ApplicationController

    def new
        @ride = Ride.new
    end 

    def create
        @attraction = Attraction.find(ride_params[:attraction])
        @ride = Ride.new(:attraction_id => ride_params[:attraction], :user_id => current_user.id)
        if @ride.valid?
          redirect_to user_path(current_user), notice: @ride.take_ride
        else
          redirect_to attraction_path(@attraction)
        end
    end 

    private
    def ride_params
        params.permit(:attraction)
    end
end 