require 'pry'
class AttractionsController < SessionsController
  def index
    @attractions = Attraction.all
  end

  def show
      @attraction = Attraction.find_by(id: params[:id])
  end

end
