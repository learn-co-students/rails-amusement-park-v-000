class RidesController < ApplicationController

    def create
        # binding.pry
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @ride = current_user.rides.create(attraction: @attraction)
        # binding.pry
        @message = @ride.take_ride
        redirect_to user_path(@ride.user), flash: {message: @message}
    end


end
