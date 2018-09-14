class RidesController < ApplicationController

    def new
        @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
        @ride.take_ride
        binding.pry
        redirect_to user_path(@ride.user)
    end
  
end