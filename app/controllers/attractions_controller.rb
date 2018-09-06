class AttractionsController < ApplicationController

  def index
    if session[:user_id].present?
      @attractions = Attraction.all
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def show
    if session[:user_id].present?
      @attraction = Attraction.find(params[:id])
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def new
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      if @user.admin
        @attraction = Attraction.new
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to root_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end 
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end

end
