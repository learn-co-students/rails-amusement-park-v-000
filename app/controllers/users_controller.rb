class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def show
    @ride = Ride.last 
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :nausea, :admin)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
