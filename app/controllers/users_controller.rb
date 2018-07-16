class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    if User.new(user_params).valid?
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @attraction = Attraction.find(params[:user][:attraction_id])
    Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    # byebug
    redirect_to user_path
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def logged_in?
    session[:user_id]
  end

end
