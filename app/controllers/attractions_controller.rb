class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    if Attraction.new(attr_params).valid?
      @attraction = Attraction.create(attr_params)
      redirect_to attraction_path(@attraction.id)
    end
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    if !@user.admin
      ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
      @user.rides << ride
      ride.take_ride
    end
    @attraction.update(attr_params)
        # Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    redirect_to attraction_path
  end

  private

  def attr_params
    params.require(:attraction).permit(:name, :tickets, :min_height,:nausea_rating, :happiness_rating)
  end
end
