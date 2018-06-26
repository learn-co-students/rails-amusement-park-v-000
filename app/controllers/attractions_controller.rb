class AttractionsController<ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    new_attr = Attraction.create(attraction_params)
    redirect_to attraction_path(new_attr)
  end

  def show
    @attraction = attraction
  end

  def edit
    @attraction = attraction
  end

  def update
    a = attraction
    a.update(attraction_params)
    redirect_to attraction_path(a)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def attraction
      @attraction ||= Attraction.find(params[:id])
    end

end
