class RidesController < ApplicationController

    def create
        #@attraction = Attraction.find_by_id(params[:id])
        #binding.pry
        @ride = Ride.create(ride_params)
        redirect_to user_path(@ride.user_id)
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end