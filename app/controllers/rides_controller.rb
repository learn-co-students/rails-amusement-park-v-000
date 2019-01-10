class RidesController < ApplicationController
    before_action :require_login

    def create
        @ride = Ride.create(user_id: current_user.id, attraction_id: params[:attraction])
        if @ride
            @ride.take_ride
            redirect_to user_path(@ride.user)
        else
            redirect_to attraction_path(@ride.attraction)
        end
    end

    
end