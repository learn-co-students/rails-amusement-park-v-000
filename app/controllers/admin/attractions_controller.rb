class Admin::AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    return redirect_to '/attractions/new' unless @attraction.save
    redirect_to admin_attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction.update(attraction_params)
    return edit_admin_attraction_path(@attraction) unless @attraction.save
    redirect_to admin_attraction_path(@attraction)
  end
end
