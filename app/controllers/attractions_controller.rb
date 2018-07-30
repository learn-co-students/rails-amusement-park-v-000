class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def ride
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if !ride.take_ride.is_a? String
      current_user.rides << ride
      attraction.rides << ride
      ride.save
      flash[:alert] = "Thanks for riding the #{attraction.name}!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = ride.take_ride
      redirect_to user_path(current_user)
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :tickets, :happiness_rating)
  end

end
