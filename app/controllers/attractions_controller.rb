class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:new, :create]

  def index
    @attractions = Attraction.all
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    
  end

  def show
    
  end

  def destroy
    
  end

  private
    def set_attraction
      @attraction = Attraction.find_by(params[:id])
    end
end
