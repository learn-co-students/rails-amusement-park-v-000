class AttractionsController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @attractions = Attraction.all
    @attraction = Attraction.new
    current_user.admin ? @attraction_link_prompt_text = "Show" : @attraction_link_prompt_text = "Go on"
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    redirect_to root_path if !@attraction
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    @attraction.valid? ? (redirect_to attraction_path(@attraction)) : (redirect_to root_path) 
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
