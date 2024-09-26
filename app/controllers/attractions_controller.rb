require 'pry'
class AttractionsController < SessionsController
  def index
    @attractions = Attraction.all
  end

  def show
      @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
    end

    def edit
      @attraction = Attraction.find_by(id: params[:id])
    end


  def update
    if current_user.admin
      @attraction = Attraction.update(attraction_params)
    end
    redirect_to attraction_path(@attraction[0][:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
