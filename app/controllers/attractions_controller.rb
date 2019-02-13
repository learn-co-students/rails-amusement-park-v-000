class AttractionsController < ApplicationController
  def index
    current_user
    @attractions = Attraction.all
  end

  def show
    current_user
    @attraction = Attraction.find(params[:id])
  end

  def new    
  end

  def create    
    @attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])    
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end 

  private

  def attractions_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :nausea_rating,
      :happiness_rating,
      :min_height
    )
  end
end

