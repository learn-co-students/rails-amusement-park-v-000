class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def create
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
