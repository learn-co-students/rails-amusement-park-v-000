class RidesController < ApplicationController


    def create
        @ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:ride][:attraction])
        @outcome = @ride.take_ride
        #binding.pry
        redirect_to user_path(@ride.user_id), :notice => "#{@outcome}"
    end
end