class AttractionsController < ApplicationController
	before_action :set_attraction, only: [:show, :edit, :update, :destroy]
	
	def index
		@attractions = Attraction.all
	end

	def show
		# @attraction = Attraction.find_by(id: params[:id])
		@ride = Ride.new
		# @attraction.rides.build(user_id:current_user.id)
	end

	def new
		@attraction = Attraction.new
	end

	def edit
		# @attraction = Attraction.find_by(id: params[:id])
		# @ride = @attraction.rides.build(user_id:current_user.id)
	end

	def create
		@attraction = Attraction.create(attraction_params)
		redirect_to attraction_path(attraction)
		# respond_to do |format|
		# 	if @attraction.save
		# 		format.html { redirect_to @attraction, notice: "Attraction was successfully created." }
		# 	else
		# 		format.html { render :new }
		# 	end
		# end
	end

	def update
		attraction = Attraction.find_by(id: params[:id])
		attraction.update(attraction_params)
		redirect_to attraction_path(attraction) #notice: "Attraction was successfully updated." }
		# 	else
		# 		format.html { render :edit }
		# 	end
		# end
	end

	def destroy
		@attraction.destroy
		respond_to do |format|
			format.html {redirect_to attractions_url, notice: "Attraction was successfully destroyed."}
		end
	end

	private

	def set_attraction
		@attraction = Attraction.find(params[:id])
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
