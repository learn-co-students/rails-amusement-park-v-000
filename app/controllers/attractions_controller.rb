class AttractionsController < ApplicationController
  before_action :attraction_set, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
    #binding.byebug
  end

  def new
    @attraction = Attraction.new
  end

  def edit

  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_set
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
