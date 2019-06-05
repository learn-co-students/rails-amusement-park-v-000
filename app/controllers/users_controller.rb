class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :set_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def create
    if User.new(user_params).save
      session[:user_id] = User.last.id
      @user = User.last
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render edit_user_path(@user)
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

end
