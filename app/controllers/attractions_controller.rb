class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
		@user = current_user
	end

	def show
		@user = current_user
		@attraction = Attraction.find(params[:id])
	end

	def go_on_ride
		@user = current_user
		@attraction = Attraction.find(params[:id])
		@ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
		if @ride.take_ride.is_a?(String)
			flash[:message] = @ride.take_ride
			redirect_to user_path(@user)
		else
			@ride.save
			flash[:message] = "Thanks for riding the #{@attraction.name}!"
			redirect_to user_path(@user)
		end
	end

	def new
		@attraction = Attraction.new
	end

	def create
		if logged_in? && current_user.admin
			@attraction = Attraction.create(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			redirect_to user_path(current_user)
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)

		if @attraction.valid?
			redirect_to attraction_path(@attraction)
		else
			render :edit
		end
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end

end
