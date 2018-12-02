class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    # byebug
    @attraction = Attraction.find(params[:id])
  end

  private

  def att_params
    params.permit(:att_id)
  end
end
