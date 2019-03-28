require 'pry'

class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    set_attraction
  #  @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    set_attraction
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      reder :new
    end
  end


  def update
    respond_to do |format|
      set_attraction
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @attraction.destroy
     redirect_to attractions_url
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
     params.require(:attraction).permit(
       :name,
       :min_height,
       :tickets,
       :happiness_rating,
       :nausea_rating
     )
   end

end
