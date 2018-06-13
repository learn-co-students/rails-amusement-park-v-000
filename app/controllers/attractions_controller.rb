class AttractionsController < ApplicationController

	def index
	  @attractions = Attraction.all
	end 

	def show
		@ride = Ride.new
		@attraction = Attraction.find(params[:id])
	end 


	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params)
		if @attraction.save
			redirect_to @attraction, notice: "Attraction was successfully created ."
		else
			flash[:notice] = "something went wrong"
			render :new
		end 
	end 

	def edit
		@attraction = Attraction.find(params[:id])
	end 

	def update
		@attraction = Attraction.new
		@attraction.update(attraction_params)
		if @attraction.save
			redirect_to @attraction, notice="Attraction was succesfully created."
		else
			render :edit 
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
