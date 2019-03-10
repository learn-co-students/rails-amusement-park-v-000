class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def show
    @attraction = Attraction.find(params[:id])

  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update
    redirect_to attraction_path(@attraction)
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end
