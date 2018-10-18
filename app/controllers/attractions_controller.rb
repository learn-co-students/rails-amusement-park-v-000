class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(current_user.id)
    @ride = Ride.new
    @ride.user_id = @user.id
    @ride.attraction_id = @attraction.id
  end

  def edit
    if current_user.admin
      @attraction = Attraction.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end

end
