class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      attraction = Attraction.new(attraction_params)
      if attraction.save
        redirect_to attraction_path(attraction)
      else
        render :new
      end
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    if current_user.admin
      attraction = Attraction.find(params[:id])
      if attraction.update(attraction_params)
        redirect_to attraction_path(params[:id])
      else
        render :edit
      end
    else
      redirect_to attraction_path(params[:id])
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
