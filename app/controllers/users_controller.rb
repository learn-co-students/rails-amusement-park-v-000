class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/users/new"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
