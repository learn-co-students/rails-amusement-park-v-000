class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def show
    byebug
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end



end
