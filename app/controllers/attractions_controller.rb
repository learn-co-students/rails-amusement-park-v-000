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

  def create
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html {redirect_to @attraction, notice: "Attraction was successfully created."}
      else
        format.html {render :new }
      end
    end
  end

  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html {redirect_to attractions_url, notice: "Attraction was successfully destroyed."}
    end
  end

  def update
   @attraction.update(attraction_params)
   redirect_to attraction_path(@attraction.id)
 end

private

def set_attraction
  @attraction = Attraction.find(params[:id])
end

def attraction_params
  params.require(:attraction).permit(:name,:min_height,:tickets,:happiness_rating,:nausea_rating)
end

end
