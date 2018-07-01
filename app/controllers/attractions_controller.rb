class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end
end
