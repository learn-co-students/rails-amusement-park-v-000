class AttractionsController < ApplicationController


  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @user = User.find(current_user.id)
    @attractions = Attraction.all    
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
    @new_ride = Ride.new
  end

  def rides
  end


  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)  
  end
end
