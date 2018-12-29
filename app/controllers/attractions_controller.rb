class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def take_ride
    @attraction = Attraction.find(params[:id])
    ride = Ride.create(user_id: session[:user_id], attraction_id: @attraction.id)
    ride.take_ride
    redirect_to '/'
  end
end
