require 'pry'
class UsersController < ApplicationController
   before_action :require_login, only: [:show]

  def home
    render "layouts/application"
  end


  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
