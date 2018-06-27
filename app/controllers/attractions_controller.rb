class AttractionsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = set_attraction
    @ride = Ride.new
  end

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
    @attraction = set_attraction
  end

  def update
    @attraction = set_attraction
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end 
  end

  def destroy
    #prob
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def set_attraction
    Attraction.find(params[:id])
  end
end
