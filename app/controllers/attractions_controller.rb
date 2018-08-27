class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    render :new
  end

  def show
    @attraction = Attraction.find(session[:user_id])

    if @attraction
      render :show
    else
      redirect_to root_path
    end
  end


end
