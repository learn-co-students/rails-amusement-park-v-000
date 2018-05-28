class AttractionsController < ApplicationController
	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find_by(:id => params[:id])
		@ride = Ride.new
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.new
		@attraction.name = params[:attraction][:name]
		@attraction.min_height = params[:attraction][:min_height]
		@attraction.happiness_rating = params[:attraction][:happiness_rating]
		@attraction.nausea_rating = params[:attraction][:nausea_rating]
		@attraction.tickets = params[:attraction][:tickets]
		@attraction.save
		redirect_to attraction_path(@attraction)
	end

	def edit
		@attraction = Attraction.find_by(:id => params[:id])
	end

	def update
		@attraction = Attraction.find_by(:id => params[:id])
		@attraction.update(
			:name => params[:attraction][:name],
			:min_height => params[:attraction][:min_height],
			:happiness_rating => params[:attraction][:happiness_rating],
			:nausea_rating => params[:attraction][:nausea_rating],
			:tickets => params[:attraction][:tickets]
		)
		redirect_to attraction_path(@attraction)
	end
end
