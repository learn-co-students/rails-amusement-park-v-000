class AttractionsController < ApplicationController
  before_action  :set_attraction, only:[:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to @attraction
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
    redirect_to @attraction
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
