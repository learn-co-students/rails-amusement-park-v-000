require 'pry'

class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    set_attraction
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    set_attraction
  end

  def create
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
      else
        format.html { render :new }
      end
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
