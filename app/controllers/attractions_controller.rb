class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
    else
      flash[:message] = "You do not have the authority to create an attraction."
      redirect_to user_path(current_user)
    end
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      flash[:message] = "Please enter all requested information."
      redirect_to new_attraction_path
    end
  end

  def edit
    if current_user.admin
      @attraction = current_attraction
    else
      flash[:message] = "You do not have the authority to edit an attraction."
      redirect_to user_path(current_user)
    end
  end

  def update
    current_attraction.update(attraction_params)
    redirect_to attraction_path(current_attraction)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
