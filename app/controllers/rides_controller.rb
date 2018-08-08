class RidesController < ApplicationController

    def index

    end

    def new

    end

    def create
        @ride = Ride.find_or_create_by(strong_params(params))
        flash[:notice] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end

    def update

    end

    def show

    end

    private

    def strong_params(params)
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end
