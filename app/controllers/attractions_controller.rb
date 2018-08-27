class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
    if @user.admin
      @prompt = "Show"
    else
      @prompt = "Go on"
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render action: 'new'
    end
  end

  def update
    @attraction = Attraction.find(params[:id])

    @attraction.name = attract[:name]
    @attraction.min_height = attract[:min_height]
    @attraction.happiness_rating = attract[:happiness_rating]
    @attraction.nausea_rating = attract[:nausea_rating]
    @attraction.tickets = attract[:tickets]

    @attraction.save

    redirect_to @attraction
  end

  private

  def attract
    params[:attraction]
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
