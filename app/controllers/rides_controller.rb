class RidesController < ApplicationController 

    def new
        @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
        @notice = @ride.take_ride 
        flash[:notice] = @notice  
        redirect_to user_path(@ride.user_id)
    end
end 