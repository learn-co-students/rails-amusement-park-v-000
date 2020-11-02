class RidesController < ApplicationController
    
    def create
        @ride = Ride.new(ride_params)
        @attraction = Attraction.find_by(id: params[:ride][:attraction])
        @user = current_user
        
    end

    def update
        @ride = Ride.find_by(id: params[:id])
        @result = @ride.take_ride
        flash[:success] = @result
        redirect_to user_path(current_user)
    end


    private
    def ride_params
        params.require(:ride).permit(:attraction)
    end
end
