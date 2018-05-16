class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    byebug
  end


end
