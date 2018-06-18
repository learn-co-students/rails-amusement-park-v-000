class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new

  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end



  def user_params
    params.require(:user).permit(:name, :password, :tickets, :height, :nausea, :happiness, :admin)
  end
end
