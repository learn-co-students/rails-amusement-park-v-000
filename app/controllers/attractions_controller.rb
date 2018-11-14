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
			
		Attraction.update(attr_params) if user.admin	
		ride = Attraction.find_by(id: params[:id])

		ride_px = ride.tickets
		
		user_tix = user.tickets
		user_tix = 0 unless user_tix
		user_height = user.height
		user_height = 0 unless user_height

		if (user_tix >= ride_px) && (user_height >= ride.min_height)
			user.tickets = user_tix - ride_px
			user.happiness = ride.happiness_rating
			user.save
			flash[:notice] = "Thanks for riding the #{ride.name}!"
		elsif (user_tix < ride_px) && (user_height < ride.min_height)
			flash[:notice] = "You are not tall enough to ride the #{ride.name}. You do not have enough tickets to ride the #{ride.name}." 
		elsif user_height < ride.min_height
			flash[:notice] = "You are not tall enough to ride the #{ride.name}"
		elsif user_tix < ride_px
			flash[:notice] = "You do not have enough tickets to ride the #{ride.name}"	
		end
		
		if user.admin
			redirect_to attraction_path(ride)
		else
			redirect_to user_path(user)
		end
	end

	def new
		@attraction = Attraction.new
	end

	def create
		#binding.pry
		Attraction.create(attr_params)
		attr = Attraction.last
		redirect_to attraction_path(attr)
	end

	def edit
		@attraction = Attraction.find_by(id: params[:id])
	end

private

	def attr_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
