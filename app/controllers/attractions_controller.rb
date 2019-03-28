class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

private

def attraction_params
  params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
end
