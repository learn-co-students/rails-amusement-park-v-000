class UsersController < ApplicationController

  def show
    if !logged_in?
      redirect_to root_url
    else
      @user = User.find(params[:id])
    end
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to user
    else
      redirect_to signup_path
    end
  end

  def update
    @user = User.find(params[:id])
    @attraction = Attraction.find(params[:attraction_id])

    ride = Ride.create(user: @user, attraction: @attraction)
    flash[:message] = ride.take_ride
    
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:admin, :name, :password, :height, :happiness, :nausea, :tickets)
  end
end
