class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :admin, :password)

  end
end
