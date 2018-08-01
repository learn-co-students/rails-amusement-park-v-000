require 'pry'
class AttractionsController < ApplicationController
	def index
		@attractions = Attraction.all
		@attraction = Attraction.new
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def show
		@attraction = Attraction.find_by(id: params[:id])
		@ride = Ride.new
		@user = current_user
	end

	def edit
		@attraction = Attraction.find_by(id: params[:id])
	end

	def update
		@attraction = Attraction.find_by(id: params[:id])
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def ride
		@attraction = Attraction.find_by(id: params[:attraction])
		@user = current_user
		@ride = Ride.create(user: @user, attraction: @attraction)
		flash[:notice] = @ride.take_ride
		redirect_to user_path(@user)
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end
end
