class RidesController < ApplicationController

	def create
		@user = current_user
		@attraction = Attraction.find_by(id: params[:attraction])
		@user.save
		@ride = Ride.create(user: @user, attraction: @attraction)
		flash[:notice] = @ride.take_ride
		redirect_to user_path(@user)
	end

end