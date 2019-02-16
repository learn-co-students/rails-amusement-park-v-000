require 'pry'
class UsersController < ApplicationController
  before_action :require_login, only:[:show]

  def index
  end

  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)
    # binding.pry
    @user.save
      if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
        render :new
      end
  end

  def show
    @user = User.find_by(id: params[:id])
  end


   private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end


end
