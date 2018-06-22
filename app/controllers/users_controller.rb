require 'pry'

class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create

    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end



  private

  def require_login
    redirect_to(controller:'static_pages', action:'home') unless current_user
  end

  def current_user
    session[:user_id]
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :tickets, :nausea, :height, :admin)
  end
end
