class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])

    render html: "#{@attraction.name}! show page"
  end
end
