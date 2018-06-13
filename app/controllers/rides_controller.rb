class RidesController < ApplicationController

	def new
		@ride = Ride.create(
			user_id: params[:ride][:user_id],
			attraction_id: params[:ride][:attraction_id]
			)
	end

	def create
		@ride = Ride.create(
			user_id: params[:ride][:user_id],
			attraction_id: params[:ride][:attraction_id]
			)
		@ride.take_ride
		flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
		redirect_to user_path(@ride.user)
	end
end 

