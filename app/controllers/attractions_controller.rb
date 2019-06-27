class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    render 'attractions/index'
  end

  def new

  end

  def create

  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  # private

  # def attraction_params
  #   params.require(:attraction).permit(:name, :tickets, :happiness_rating, :min_height, :tickets, :height, :nausea_rating)
  # end
end
