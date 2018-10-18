class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find_by(params[:id])
  end

  def update
    
    redirect_to user_path(current_user.id)
  end

private

  def current_user
    User.find_by(id: session[:user_id])
  end
end

#redirect to user path after updating tickets
#how to use the Ride methods to make this happen? 