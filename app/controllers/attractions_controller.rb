class AttractionsController < ApplicationController
  before_action :authenticate_user

  def index
    @attractions = Attraction.all
  end

  def show
    set_attraction
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
    set_attraction
  end

  def update
    set_attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def authenticate_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
