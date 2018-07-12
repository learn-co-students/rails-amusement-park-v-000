class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    binding.pry
  end
end
