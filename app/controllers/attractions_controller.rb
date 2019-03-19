class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction, notice: 'Attraction was successfully updated.')
    else
        redirect_to edit_attraction_path(@attraction)
    end
  end

end
