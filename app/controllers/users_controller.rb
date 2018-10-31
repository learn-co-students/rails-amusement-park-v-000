class UsersController < ApplicationController
  before_action :require_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message]
  end

  private
  def user_params
    params.require(:user).permit(:happiness, :name, :password, :nausea, :tickets, :height, :admin)
  end
end
