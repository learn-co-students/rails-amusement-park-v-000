class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new 
    byebug
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(current_user)
  end


end
