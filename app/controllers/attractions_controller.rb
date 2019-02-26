class AttractionsController < ApplicationController
  include AttractionsHelper

  def index
  end

  def show
    @attraction = Attraction.find(params[:id])

  end

  def new
    @attr = Attraction.new
  end

  def create
    @attr = Attraction.new(attraction_params)
    if @attr.save
      redirect_to attraction_path(@attr)
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name,:tickets, :happiness_rating, :nausea_rating, :min_height)
    end
end
