class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all

	end

	def show
		@attraction = Attraction.find_by(id: params[:id])
	end

	def create

		ride = Ride.new(user_id: current_user.id, attraction_id: params[:id])
		binding.pry
		status = ride.take_ride
		if status == true
			ride.save
			@status = ride.take_ride
		end
		
		redirect_to user_path(current_user)
	end




end