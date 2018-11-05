class RidesController < ApplicationController
	def create
		ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: session[:user_id])
		alert_message = ride.take_ride
		redirect_to user_path(ride.user), alert: alert_message
	end
end
