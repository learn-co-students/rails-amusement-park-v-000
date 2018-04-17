class AttractionsController < ApplicationController
	before_action :set_attraction, only: [:show, :edit, :update]
	before_action :is_admin, only: [:edit, :update]

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))

		if @attraction.save
			redirect_to attraction_path(@attraction)
		else
			render :new
		end
	end

	def show
		@message = params[:message] if params[:message].present?
	end

	def edit
	end

	def update
		@attraction.update(attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))

		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params(*args)
		params.require(:attraction).permit(*args)
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end
end
