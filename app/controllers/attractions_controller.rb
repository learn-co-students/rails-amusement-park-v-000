class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @user = User.new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

end
