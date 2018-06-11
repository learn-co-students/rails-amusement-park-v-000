class AttractionsController < ApplicationController

	def new
		if current_user.admin == true
			@attraction = Attraction.new
		else
			redirect_to root_path
		end
	end

	def index
		@attractions = Attraction.all

	end

	def show
		@attraction = Attraction.find_by(id: params[:id])
	end

	def create
		
		if params[:attraction] == nil
	
			ride = Ride.new(user_id: current_user.id, attraction_id: params[:id])
			
			status = ride.take_ride
			
			if status == true
				ride.save
				
				session[:ride] = "Thanks for riding the #{ride.attraction.name}!"
			

				# @ride = ride
				# binding.pry
			else
				status = status.gsub(/^(.......)/, '')
				status = status.gsub(/[.]/, '')
			
				session[:ride] = status.strip
				
			end
			redirect_to user_path(current_user)
		

		else
			attraction = Attraction.create(new_attraction)
			redirect_to attraction_path(attraction)
			
		end

	def edit
		@attraction = Attraction.find_by(id: params[:id])

	end


	def update
		attraction = Attraction.find_by(id: params[:id])
		
		attraction.update(new_attraction)
		redirect_to attraction_path(attraction)

	end
		
	end

	private

		def new_attraction
			params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
		end




end