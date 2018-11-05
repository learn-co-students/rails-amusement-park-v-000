class AttractionsController < ApplicationController
  before_action :require_login

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    # raise params.inspect
    @attraction = Attraction.create(attraction_params)
    if @attraction
      # session[:attraction_id] = @attraction.id
      redirect_to controller: 'attractions', action: 'show', id: @attraction.id
    else
      render 'new'
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    # raise params.inspect
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end

end
