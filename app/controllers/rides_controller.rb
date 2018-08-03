class RidesController < ApplicationController

    def new
        @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
        session[:message] = @ride.take_ride
        session[:message] ||= "Thanks for riding the #{Attraction.find(@ride.attraction_id).name}!"
        redirect_to user_path(@ride.user)
    end

end