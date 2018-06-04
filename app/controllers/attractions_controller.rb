class AttractionsController < ApplicationController
	
	def index
	end

	def show
		@attractions = Attraction.all
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	private

	def set_attraction
	end

	def attraction_params
		params.require(:attraction).permit(
			:name, 
			:tickets, 
			:nausea_rating, 
			:happiness_rating, 
			:min_height
			)
	end

end
