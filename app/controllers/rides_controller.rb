class RidesController < ApplicationController

    def create
        @ride = Ride.find_or_create_by(user_id: params[:user_id], attraction_id: params[:attraction_id])
        @message = @ride.take_ride
        flash[:notice] = @message
        redirect_to user_path(session[:user_id])
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end