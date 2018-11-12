class AttractionsController < ApplicationController
	include ApplicationHelper

	def index
		@attrs = Attraction.all
	end

	def show
		@attr = Attraction.find_by(id: params[:id])
		render :index unless @attr
	end

	def update
		user = hot_user
		
		ride = Attraction.find_by(id: params[:id])

		ride_px = ride.tickets
		if (user.tickets >= ride_px) && (user.height >= ride.min_height)
			user.tickets = user.tickets - ride_px
			user.happiness = ride.happiness_rating
			user.save
			flash[:notice] = "Thanks for riding the #{ride.name}!"
		elsif (user.tickets < ride_px) && (user.height < ride.min_height)
			flash[:notice] = "You are not tall enough to ride the #{ride.name}. You do not have enough tickets to ride the #{ride.name}." 
		elsif user.height < ride.min_height
			flash[:notice] = "You are not tall enough to ride the #{ride.name}"
		elsif user.tickets < ride_px
			flash[:notice] = "You do not have enough tickets to ride the #{ride.name}"	
		end
		
		redirect_to user_path(user)
	end
end
