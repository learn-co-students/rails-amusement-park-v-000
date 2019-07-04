class AttractionsController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    redirect_to root_path if !@attraction
  end

end
