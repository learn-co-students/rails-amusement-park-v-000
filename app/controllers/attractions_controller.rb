class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    if logged_in?
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def show
    if logged_in?
      @attraction = Attraction.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])
      if !@user.nil? && !@attraction.nil?
        @ride = Ride.new(:user_id => @user.id, :attraction_id => @attraction.id)
      else
        render edit_attraction_path(@attraction)
      end
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    user = User.find_by_id(session[:user_id])
    if user.admin?
      attraction.save
      redirect_to attraction_path(attraction)
    else
      redirect_to '/'
    end
  end

  def edit
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    attraction = Attraction.find_by(:id => params[:id])
    attraction.update(attraction_params)

    redirect_to attraction_path(attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
