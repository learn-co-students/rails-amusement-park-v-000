class AttractionsController < ApplicationController
	before_action :not_admin, only: [:new, :edit, :destroy]

	def index
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def create
		if @attraction = Attraction.create(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			render :new
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		redirect_to attraction_path(@attraction) if @attraction.update(attraction_params)
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def ride
		@attraction = Attraction.find(params[:attraction_id])
		message = @attraction.rides.build(user_id: helpers.current_user.id).take_ride

		redirect_to user_path(helpers.current_user), alert: message
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :happiness_rating, :tickets, :min_height, :nausea_rating)
	end

	def not_admin
		return redirect_to user_path(helpers.current_user) unless helpers.current_user.admin
	end

end