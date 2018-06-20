class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    #binding.pry
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
      if @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
      else
        render edit_attraction_path(@attaction)
      end
  end



  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to root_path
    end
  end


  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
