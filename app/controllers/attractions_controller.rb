class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
  end
end
