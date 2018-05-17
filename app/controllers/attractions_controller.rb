class AttractionsController < ApplicationController
  
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render 'new'
      end
  end

  def show
   @attraction = Attraction.find(params[:id])
   @ride = Ride.new
  end

  def index
    @attractions = Attraction.all
  end

  def edit
    @attraction =Attraction.find(params[:id])
  end

  def update
      if  Attraction.update(attraction_params)
        @attraction =Attraction.find(params[:id])
        redirect_to attraction_path(@attraction)
      else
        render 'edit'
      end
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :nausea_rating,
      :happiness_rating,
      :min_height
      )
  end
end
