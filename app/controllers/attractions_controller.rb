class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = current_user
  end
end
