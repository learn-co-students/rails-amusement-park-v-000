class AttractionsController < ApplicationController 
# front end 
	def index 
		@attractions = Attraction.all
		@user = getUser
	end 

	def show 
		@attraction = Attraction.find(params[:id])
		@user = getUser
	end 

	def edit 
		@attraction = Attraction.find(params[:id])
	end 

	def new 
		@attraction = Attraction.new
	end 
# back end 

	def take_ride 
		@user = getUser 
		@attraction = Attraction.find(params[:attraction_id])
		@ride = Ride.create
		@ride.attraction = @attraction 
		@ride.user = @user 
		message = @ride.take_ride 
		redirect_to user_path(@user), alert: message
	end 

	def create 
		if Attraction.create!(strong_params)
			redirect_to attraction_path(Attraction.last) 
		else 
			redirect_to new_attraction_path, alert: "Something went wrong." 
		end 
	end

	def delete 

	end 
	
	def update 
		if Attraction.update(strong_params)
			redirect_to attraction_path(params[:id]) 
		else 
			redirect_to edit_attraction_path, alert: "Something went wrong." 
		end 
	end 

# helper
	def strong_params 
		params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end 

	
end 
