class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    render :show
  end

end
