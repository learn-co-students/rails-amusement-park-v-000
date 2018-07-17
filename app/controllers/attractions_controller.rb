class AttractionsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

   def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
        redirect_to attraction_path(@attraction)
    else
        redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.assign_attributes(attraction_params)
    if @attraction.save
        redirect_to attraction_path(@attraction)
    else
        render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
