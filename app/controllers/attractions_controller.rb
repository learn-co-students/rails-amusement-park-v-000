class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    if logged_in?
      @user = User.find[session[:user_id]]
      if @user.admin
        @attraction = Attraction.new
      else
        redirect_to attractions_path
      end
    else
      redirect_to '/signin'
    end
  end

  def create
    @attraction = Attraction.new(params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def edit
    if logged_in?
      @user = User.find[session[:user_id]]
      if @user.admin
        @attraction = Attraction.find(params[:id])
      else
        redirect_to attractions_path
      end
    else
      redirect_to '/signin'
    end
  end

end
