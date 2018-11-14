class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    # if attraction.save
    #   redirect_to attraction_path(attraction)
    # else
    #   render :new
    # end
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
