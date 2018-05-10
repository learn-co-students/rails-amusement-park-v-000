class AttractionsController < ApplicationController

  def new
  	@attraction = Attraction.new 
  end

  def index
  	@attractions = Attraction.all 
  	@user = current_user 
  end

  def show
  	@attraction = Attraction.find(params[:id])
  	@user = current_user 
  	@ride = Ride.new 
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
  	@attraction = Attraction.find(params[:id])
  end 

  def update 
  	raise params.inspect
  	@attraction.update(attraction_params)
  	redirect_to attraction_path(@attraction)
  end 


  private 

  	def attraction_params
  		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  	end 

end
