class AttractionsController < ApplicationController

	def index
	  @attractions = Attraction.all
	end 

	def show

		@attraction = Attraction.find(params[:id])
	end 


	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			redirect_to @attraction
		else
			render :new, notice="something went wrong"
		end 
	end 

	def edit
		@attraction = Attraction.find(params[:id])
	end 

	def update
		@attraction = Attraction.new
		@attraction.update(attraction_params)
		if @attraction.save
			redirect_to @attraction
		else
			render :edit, notice="something went wrong"
		end

	end 

	def destroy
		@attraction = Attraction.find(params[:id])
		@attraction.destroy
		redirect_to @attractions_path
	end 

	private
	def attraction_params
		require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end 

end 
