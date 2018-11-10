class AttractionsController < ApplicationController
  before_action :attraction
  skip_before_action :attraction, only: [:new, :create, :index]

  def show
    @ride = Ride.new
  end

  def edit
  end

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    respond_to do |format|
      if !@attraction.save
        format.html { render :new }
      else
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
    end
  end

  private
    def attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :happiness_rating, :min_height, :nausea_rating, :tickets)
    end
end
