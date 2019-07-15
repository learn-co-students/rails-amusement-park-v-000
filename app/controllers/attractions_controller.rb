class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end 
  
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @user = User.find(session[:user_id]) #- in ride controller
  end

  end