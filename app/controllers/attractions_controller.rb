class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end
  end
end
