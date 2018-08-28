class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @attraction = Attraction.find_by_name(params[:user][:attraction])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:message] = "#{@ride.take_ride}"
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
