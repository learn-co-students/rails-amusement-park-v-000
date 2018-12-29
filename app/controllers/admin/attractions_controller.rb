class Admin::AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    return redirect_to '/attractions/new' unless @attraction.save
    redirect_to attraction_path(@attraction)
  end
end
