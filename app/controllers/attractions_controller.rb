require 'pry'
class AttractionsController < SessionsController
  def index
    @attractions = Attraction.all
  end

  def show
      @attraction = Attraction.find_by(id: params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    end


  def update
    @attraction = Attraction.update(attraction_params)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
