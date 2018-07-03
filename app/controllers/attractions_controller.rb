class AttractionsController < ApplicationController

  def new
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end
end
