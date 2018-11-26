class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      render 'show'
    else
      redirect_to "/"
    end
  end
end
