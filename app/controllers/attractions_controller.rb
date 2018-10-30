class AttractionsController < ApplicationController
  
  def index
      @attractions = Attraction.new
      @attractions = Attraction.all
  end

end
