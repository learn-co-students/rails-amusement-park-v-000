class RidesController < ApplicationController
    
    def create
        @ride = Ride.new(attraction_id: params[:attraction_id])
        @ride.user = current_user
        @ride.save
        flash[:notice] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end

end