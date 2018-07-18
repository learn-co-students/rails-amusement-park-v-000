class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find_by_id(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    session[:attraction_id] = @attraction.id
    if @attraction.save
        @attraction.save
        redirect_to @attraction
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    session[:attraction_id] = @attraction.id
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
