class UsersController < ApplicationController

  before_action :logged_in?, only: [:index, :show]

  def new

  end

  def create #user signup
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @mood = @user.mood

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end



end
