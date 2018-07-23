class AttractionsController < ApplicationController

  def index
    #binding.pry
    @attractions = Attraction.all
  end

  def show
    binding.pry
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @ride.attraction = @attraction
  end

end
