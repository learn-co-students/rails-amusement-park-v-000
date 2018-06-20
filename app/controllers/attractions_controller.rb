class AttractionsController < ApplicationController
  # before_action :require_login, only: [:new, :create]
  def index
    @attractions = Attraction.all

  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    binding.pry
    @attraction = Attraction.find(params[:id])

    @attraction.update(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path attraction
  end


  private

  def attraction_params
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
