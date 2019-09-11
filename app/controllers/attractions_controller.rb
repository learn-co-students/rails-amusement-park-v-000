class AttractionsController < ApplicationController


  def index
    @attractions = Attraction.all    
  end

  def show
    @attraction = Attraction.find(params[:id])
    @new_ride = Ride.new
  end

  def rides
  end

end
