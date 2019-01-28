class AttractionsController < ApplicationController
before_action :set_attraction, only: [:show, :edit, :update]
  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      flash[:message] = "Sucess! #{@attraction.name} is now operational."
      redirect_to attraction_path(@attraction)
    else
      flash[:message] = "Please fill in all fields to make a new attraction."
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
      flash[:message] = "Attraction successfully updated!"
    else
      render :edit
    end
  end


private

def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
