class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
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

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    attraction = Attraction.find(params[:id])
    ride = attraction.rides.build("user_id" => current_user.id)
    ride.save
    error = ride.take_ride
    if error == "Sorry."
      flash[:thanks] = "Thanks for riding the #{attraction.name}!"
    else
      flash[:sorry] = error
    end
    redirect_to user_path(current_user)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
