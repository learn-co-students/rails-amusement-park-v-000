class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

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
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end

  end

  def destroy
  end
end

private

def attraction_params
  params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
end
