
class RidesController < ApplicationController
    before_action :require_login

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

    def require_login
        unless logged_in?
            redirect_to root_url
        end
    end
end
