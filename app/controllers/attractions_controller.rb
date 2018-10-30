require 'pry'
class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    #binding.pry
    @attraction = Attraction.find_by(id: params[:id])
    #redirect_to attraction_path(@attraction)
  end

  def new
  end

end
