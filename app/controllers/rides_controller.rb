class RidesController < ApplicationController
    def create
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction_id])
        message = ride.take_ride
        flash[:message] = message
        redirect_to user_path(ride.user_id)
    end
end