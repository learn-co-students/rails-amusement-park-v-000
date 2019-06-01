class AttractionsController < ApplicationController
  helper_method :current_user
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end
end
