class Admin::AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    current_user
  end

  def new
  end

  def create
  end

  def show
  end
end
