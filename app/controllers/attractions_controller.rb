class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    raise params.inspect
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
      flash[:alert] = "Thanks for riding the #{@attraction.name}!"
    else
      flash[:alert] = message
    end

    redirect_to user_path(@ride.user)


  end
end
