class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @new_ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'attractions/new'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
