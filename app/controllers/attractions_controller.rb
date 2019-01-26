class AttractionsController < ApplicationController
before_action :set_attraction, only: :show
  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

end


private

def set_attraction
    @attraction = Attraction.find(params[:id])
  end
