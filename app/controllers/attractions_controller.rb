class AttractionsController < ApplicationController
  def index
    # binding.pry
    @attractions = Attraction.all 
    @user = current_user
    # => []
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @user = current_user
    
  end
end
