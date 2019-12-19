class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to "/attractions/#{@attraction.id}"
    else
      flash[:notice] =  "There was an error."
      render '/attractions/new'
    end
  end

  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.update(attraction_params)
    redirect_to attraction_url
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end

