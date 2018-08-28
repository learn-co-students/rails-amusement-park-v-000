class AttractionsController < ApplicationController
  include UsersHelper

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end
end
