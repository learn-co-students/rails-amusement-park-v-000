require 'rack-flash'

class UsersController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:home, :new, :create]

  use Rack::Flash

  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new do |u|
     u.name = params[:user]['name']
     u.height = params[:user]['height']
     u.happiness = params[:user]['happiness']
     u.nausea = params[:user]['nausea']
     u.tickets = params[:user]['tickets']
     u.admin = params[:user]['admin']
     u.password = params[:user]['password']
    end
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
   else
     render '/users/new'
   end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end


end
