class AttractionsController < ApplicationController
	skip_before_action :verify_user_is_authenticated, only: [:new, :create]

	def new
		@attraction = Attraction.new 
	end

	def create
		attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(attraction)
	end

	def edit 
		@attraction = Attraction.find_by(id: params[:id])
		@ride = @attraction.rides.build(user_id: current_user.id)
	end	

	def update
		attraction = Attraction.find_by(id: params[:id])
    	attraction.update(attraction_params)
   		redirect_to attraction_path(attraction)
	end


	def index
		@attractions = Attraction.all 
	end

	def show
		@attraction = Attraction.find_by(id: params[:id])
		@ride = @attraction.rides.build(user_id: current_user.id, attraction_id: @attraction.id)
	end
 
	private 

	def attraction_params 
		params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
	end	

end