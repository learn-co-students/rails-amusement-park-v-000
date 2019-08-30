class AttractionsController < ApplicationController
  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def show
    @user = current_user
    @attraction = Attraction.find_by(id: params[:id])
    if request.post?
      @user.attractions << @attraction
      @user.ride = Ride.find_by(attraction_id: @user.attractions.last.id)
      # @user.ride.take_ride
      flash[:alert] = @user.ride.take_ride
      flash.keep
      redirect_to current_user
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
