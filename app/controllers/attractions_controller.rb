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
			redirect_to attraction_path(@attraction)
		else
			render :new
		end
	end

	def edit
		if is_admin?
			@attraction = Attraction.find(params[:id])
		else
			flash[:message] = "Requires admin privelages."
			redirect_to attractions_path
		end
	end

	def update
		if is_admin?
			@attraction = Attraction.find(params[:id])
			@attraction.update(attraction_params)
			if @attraction.save
				redirect_to attraction_path(@attraction)
			else
				render :edit
			end
		else
			flash[:message] = "Requires admin privelages."
			redirect_to attractions_path
		end
	end

	def destroy
		if is_admin?
			Attraction.find(params[:id])
			redirect_to attractions_path
		else
			flash[:message] = "Requires admin privelages."
			redirect_to attraction_path
		end
	end

	private
	def attraction_params
		params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets)
	end
end