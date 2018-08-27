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
    render html: "We are gonna update the heck out of this attraction!"
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
