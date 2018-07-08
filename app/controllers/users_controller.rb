require 'pry'
class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.where(name: params[:user][:name]).first_or_create do |user|
      user.password = params[:user][:password]
      user.nausea = params[:user][:nausea]
      user.happiness = params[:user][:happiness]
      user.tickets = params[:user][:tickets]
      user.height = params[:user][:height]
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      redirect_to '/'

    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
