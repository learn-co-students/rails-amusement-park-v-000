require 'pry'
class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    #binding.pry
    @attraction = Attraction.find_by(id: params[:id])
    #redirect_to attraction_path(@attraction)
  end

  def new
      @attraction = Attraction.new
  end

  def create
    #binding.pry
    @user = User.find_by(id: session[:user_id])
    if @user.admin
      @attraction = Attraction.create(att_params)
      redirect_to attraction_path(@attraction)
    end
  end

  private

  def att_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
