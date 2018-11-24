class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.new(user_params)
    if user && user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
