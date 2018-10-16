class UsersController < ApplicationController

  def index
  render :application
  end

  def new
    @user = User.new
  end

  def create
  
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render new_users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
