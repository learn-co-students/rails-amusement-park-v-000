class RidesController < ApplicationController

	def create
		ride = Ride.create(ride_params)
		ride_response = ride.take_ride
		if ride_response.is_a?(String)
			flash[:unauthorized] = ride_response
		else
			attraction = Attraction.find_by(id: params[:attraction_id])
			flash[:success] = "Thanks for riding the #{attraction.name}!"
		end
		redirect_to User.find_by(id: params[:user_id])
	end

	private

	def ride_params
		params.permit(:attraction_id, :user_id)
	end

end