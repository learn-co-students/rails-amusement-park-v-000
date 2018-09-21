class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: "Attraction was successfully update."}
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
      if @attraction
        redirect_to attraction_path(@attraction)
      end
  end

  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html {redirect_to attractions_url, notice: "Attraction was successfully destroyed."}
    end
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
