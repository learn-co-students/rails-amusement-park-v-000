class RidesController < ApplicationController
    before_action :authorize
    def create
        ride = Ride.new(user: current_user, attraction_id: params[:attraction][:id])
        begin
            ride.take_ride
            ride.save
            flash[:message] = "Thanks for riding the #{ride.attraction.name}!"
            redirect_to user_path(ride.user)
        rescue Exceptions::RideError => e
            flash[:alert] = e.message
            redirect_to user_path(ride.user)
        end
    end
end