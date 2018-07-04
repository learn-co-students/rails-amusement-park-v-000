class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])

  end

  def go
    @user = User.find_by(id: session[:user_id])
    take_ride
    redirect_to user_path(@user)
  end
end
