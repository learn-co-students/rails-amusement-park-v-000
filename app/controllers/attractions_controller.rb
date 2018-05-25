class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path @attraction
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
    redirect_to attraction_path(@attraction, message: "Update Successful")
  end

  def destroy
    #code
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name,:nausea_rating, :happiness_rating, :tickets, :min_height )
  end
end
