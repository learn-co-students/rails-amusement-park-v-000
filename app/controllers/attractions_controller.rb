class AttractionsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @attraction = Attraction.new
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

  def show
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end
    def set_params
      @attraction = Attraction.find(params[:id])
    end
end
