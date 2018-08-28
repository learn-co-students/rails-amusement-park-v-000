class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    raise user_params
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    raise @user.inspect
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end
end
