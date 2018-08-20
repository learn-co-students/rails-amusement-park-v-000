class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user
    @ride = Ride.new
  end
end
