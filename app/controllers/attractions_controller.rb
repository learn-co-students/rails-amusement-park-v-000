class AttractionsController < ApplicationController

  def index
    if session[:user_id].present?
      @attractions = Attraction.all
    else
      redirect_to root_path
    end 
  end

  def show
    if session[:user_id].present?
      @attraction = Attraction.find(params[:id])
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end
end
