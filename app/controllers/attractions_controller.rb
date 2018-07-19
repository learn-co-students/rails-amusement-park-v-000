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

  def edit
  end

  def create
  end

  def update
  end

  private

  def attraction_set
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
