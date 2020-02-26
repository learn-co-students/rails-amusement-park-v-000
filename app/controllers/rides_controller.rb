class RidesController < ApplicationController

    def new
    end
    
    def create
       raise params.inspect
        @ride = Ride.new(ride_params)
        @attraction = Attraction.find_by(id: params[:ride][:attraction])
        @user = current_user
        binding.pry
        @ride.take_ride

        redirect to @user
    end



    private
    def ride_params
        params.require(:ride).permit(:attraction)
    end
end
