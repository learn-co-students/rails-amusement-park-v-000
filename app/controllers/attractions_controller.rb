class AttractionsController < ApplicationController
  before_filter :require_admin, :only => [:new, :update]
  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
    @user = current_user
  end

  #Test Comment. Please ignore.
  #Test Comment #2. Please ignore.
  #erikas comment
  def create
    # binding.pry
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end

  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def require_admin
    user = current_user
    unless user.admin
      redirect_to '/attractions'
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end