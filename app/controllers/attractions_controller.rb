class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attr_params)
    if @attraction.save && current_user.admin
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attr_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

    def attr_params
      params.require('attraction').permit('name', 'min_height', 'happiness_rating', 'nausea_rating', 'tickets')
    end

end
