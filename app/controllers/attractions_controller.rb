class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      render 'show'
    else
      redirect_to "/"
    end
  end

  def edit
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      redirect_to "/attractions/#{@attraction.id}"
    else
      redirect_to '/attractions/new'
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to "/attractions/#{@attraction.id}"
    else
      redirect_to "/attractions/#{@attraction.id}/edit"
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
