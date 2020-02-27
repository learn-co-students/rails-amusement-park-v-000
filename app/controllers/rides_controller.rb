class RidesController < ApplicationController
    
    def create
       # raise params.inspect
        @ride = Ride.new(ride_params)
        @attraction = Attraction.find_by(id: params[:ride][:attraction])
        @user = current_user
      #  binding.pry
        
    end

    def update
       # binding.pry
         @ride = Ride.new

        @ride.attraction_id = params[:ride][:attraction_id]
        @ride.user_id = params[:ride][:user_id]
        @ride.take_ride
        redirect_to user_path(current_user)
    end


    private
    def ride_params
        params.require(:ride).permit(:attraction)
    end
end
