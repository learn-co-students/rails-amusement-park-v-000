class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = @user.rides.build(user_id: @user.id, attraction_id: @attraction.id)
    @ride.save
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)

    redirect_to @attraction
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(name: params[:attraction][:name])
    redirect_to @attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_ratin, :nausea_ratin, :tickets)
  end
end
