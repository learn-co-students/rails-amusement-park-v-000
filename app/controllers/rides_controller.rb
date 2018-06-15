class RidesController < ApplicationController

	def new
		@ride = Ride.create(
			user_id: params[:ride][:user_id],
			attraction_id: params[:ride][:attraction_id]
			)
	end

	def create
		binding.pry
		@ride = Ride.create(
			user_id: params[:ride][:user_id],
			attraction_id: params[:ride][:attraction_id]
			)
		@ride.take_ride
 		# @message = @ride.take_ride
   #  	redirect_to user_path(@ride.user, :message => @message)

   			redirect_to user_path(@ride.user)
	end
end 

