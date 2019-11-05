class RidesController < ApplicationController
    #use Rack::Flash

    def new
        @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
        flash[:notice] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end

end
