class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    render 'attractions/index'
  end

  def new

  end

  def create

  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end
