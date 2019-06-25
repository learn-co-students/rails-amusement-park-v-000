class AttractionsController < ApplicationController
  before_action :current_admin, only: [:new, :create, :edit, :destroy]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:id, :name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
