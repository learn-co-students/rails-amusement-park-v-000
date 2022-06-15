class AttractionsController < ApplicationController
  
  before_action :find_attraction, only: [:show, :edit, :update]
  
  def index
    @attractions = Attraction.all 
  end 
  
  def show 
    @ride = @attraction.rides.build(user_id: current_user.id)
  end 
  
  def new 
    @attraction = Attraction.new 
  end 
  
  def create 
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end 
  
  def edit 
    @ride = @attraction.rides.build(user_id: current_user.id)
  end  
  
  def update 
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end 
  
  # ------------------------------PRIVATE METHODS BELOW ---------------------------------
  private
  
  
  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end 
  
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end 
  
end
