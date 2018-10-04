class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    current_attraction
    @ride = Ride.new
  end

  def new
       @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.persisted?
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "The Attraction was unable to be created"
      redirect_back fallback_location: new_attraction_path
    end
  end

  def edit
    current_attraction # <-- found and assign the object. returns instance variable
  end

  def update
    current_attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit([:name,:tickets,:nausea_rating,:happiness_rating,:min_height])
  end

end
