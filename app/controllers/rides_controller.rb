class RidesController < ApplicationController
    
    def create
        @ride = Ride.new(attraction_id: params[:attraction_id])
        @ride.user = User.find(session[:user_id])
        @ride.save
        flash[:notice] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end

end