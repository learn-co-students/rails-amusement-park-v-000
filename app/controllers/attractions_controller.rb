class AttractionsController < ApplicationController
  def new
      @attraction = Attraction.new
  end

  def create
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
          redirect_to @attraction
      else
          redirect_to new_attraction_path
      end
  end

  def edit
      @attraction = Attraction.find_by(id: params[:id])
  end

  def update
      @attraction = Attraction.find_by(id: params[:id])
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
  end

  def show
      @attraction = Attraction.find_by(id: params[:id])
  end

  def index
      @attractions = Attraction.all
  end

  private

  def attraction_params
      params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end
end
