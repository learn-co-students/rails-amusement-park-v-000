class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def new
    if logged_in?
      @user = User.find(session[:user_id])
      if @user.admin
        @attraction = Attraction.new
      else
        redirect_to attractions_path
      end
    else
      redirect_to '/signin'
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    if logged_in?
      @user = User.find(session[:user_id])
      if @user.admin
        @attraction = Attraction.find(params[:id])
      else
        redirect_to attractions_path
      end
    else
      redirect_to '/signin'
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
