class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end

end
