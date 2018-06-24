class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to '/'
      end
    end

    def show
      @attraction = set_attraction
      @user = current_user
      @ride = Ride.new(attraction_id: @attraction.id, user_id: @user.id)
    end

    def edit
      @attraction = set_attraction
    end


    def update
      @attraction = set_attraction
      @attraction.update(attraction_params)

      redirect_to attraction_path(@attraction)
    end

private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end


end
