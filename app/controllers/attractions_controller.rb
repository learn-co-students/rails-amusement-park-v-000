class AttractionsController < ApplicationController
  before_action :admin, except: [:index, :show]
  before_action :find_attraction, only: [:show, :edit, :update]


  def index 
    @attractions = Attraction.all 
  end

  def show
    
  end

  def new 
    @attraction = Attraction.new
  end

  def create 
    @attraction = Attraction.new(attraction_params)
    if @attraction.save 
      redirect_to attraction_path 
    else 
      redirect_to new_attraction_path 
    end 
  end

  def edit
    
  end

  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
      end
    end
  

  private 

  def find_attraction 
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
