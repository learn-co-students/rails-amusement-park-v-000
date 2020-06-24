class AttractionsController < ApplicationController
  def new
    @user = current_user
    if @user.admin?
      @attraction = Attraction.new
    else
      flash[:alert] = "You must be an admin to access this page"
      redirect_to attractions_path
    end
  end

  def create
    user = current_user
    if user.admin?
      attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(attraction)
    else
      flash[:alert] = "You must be an admin to access this page"
      redirect_to attractions_path
    end
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    user = current_user
    @attraction = Attraction.find(params[:id])
    if user && user.admin?

    else
      flash[:alert] = "You must be an admin to access this page"
      redirect_to attractions_path
    end
  end

  def update
  user = current_user
    attraction = Attraction.find(params[:id])
    if user && user.admin?
      attraction.update(attraction_params)
      redirect_to attraction_path(attraction)
    else
      flash[:alert] = "You must be an admin to access this page"
      redirect_to attractions_path
    end
  end

  def destroy

  end

  def take_ride
    new_ride = Ride.new(user_id: current_user.id, attraction_id: params[:id])
    flash[:notice] = new_ride.take_ride
    redirect_to user_path(current_user)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end
