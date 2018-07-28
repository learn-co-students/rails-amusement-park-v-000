class UsersController < ApplicationController
  before_action :auth_user
  skip_before_action :auth_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #raise params.inspect
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
  end

  private

  def auth_user
    if !logged_in?
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
  end
end
