class UsersController < ApplicationController

  def new

  end

  def create
    User.create(user_params)
    byebug
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end



end
