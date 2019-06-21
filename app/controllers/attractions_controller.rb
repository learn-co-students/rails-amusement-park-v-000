class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    # @user = User.find_by(id: params[:id])
    # binding.pry
    # redirect_to user_path(user)
  end


end
