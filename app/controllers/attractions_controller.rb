class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def index
    @attractions = Attraction.all
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(:user_id => current_user.id, :attraction_id => @attraction.id)
    message = @ride.take_ride
    if message.blank?
      flash[:success] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:alert] = message
    end
    redirect_to user_path(current_user)
  end



  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :happiness_rating,
      :nausea_rating,
      :tickets
    )
  end

end
