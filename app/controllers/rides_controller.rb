class RidesController < ApplicationController
    def create
        @ride = Ride.new(attraction_id: params[:id], user_id: session[:user_id])
        a_name = Attraction.find(@ride.attraction_id).name
        if @ride.take_ride.is_a?(String)
            flash[:message] = @ride.take_ride.delete_suffix!('Roller Coaster.') + a_name
        else
            flash[:message] = "Thanks for riding the #{a_name}!"
        end
        redirect_to "/users/#{@ride.user_id}"
    end
end
