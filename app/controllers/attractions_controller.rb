class AttractionsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def delete
  end
end
