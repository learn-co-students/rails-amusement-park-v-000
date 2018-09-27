require 'pry'
class UsersController < ApplicationController
before_action :require_login, except: [:create, :new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    binding.pry
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login

     redirect_to '/' unless session.include? :user_id
   end
end
