class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  private

  def attraction_set
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
