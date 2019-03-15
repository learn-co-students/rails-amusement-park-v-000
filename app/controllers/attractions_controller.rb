class AttractionsController < ApplicationController

  def index
    render :home
  end
  
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end
