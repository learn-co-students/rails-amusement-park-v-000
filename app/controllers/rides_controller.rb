class RidesController < ApplicationController
	def ride
		@ride = Ride.new
		@ride.user = User.find_by(:id => params[:ride][:user_id])
		@ride.attraction = Attraction.find_by(:id => params[:ride][:attraction_id])
		if @ride.meets_requirements?
			@ride.take_ride
			flash[:ride] = "Thanks for riding the #{@ride.attraction.name}!"
			redirect_to user_path(current_user.id)
		else
			flash[:error] = @ride.take_ride
			redirect_to user_path(current_user.id)
		end

	end
end
