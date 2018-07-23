class UsersController < ApplicationController
  before_action :lookup_user, only: [:show, :edit]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def welcome

  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def lookup_user
    @user = User.find_by(id: params[:id])
  end

  def require_login
    if !session[:user_id]
      redirect_to root_path
    end
  end
end
