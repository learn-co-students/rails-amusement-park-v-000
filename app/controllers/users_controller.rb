require 'pry'

class UsersController < ApplicationController
  # before_action :authenticate_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

    def show
      @user = User.find(session[:user_id])
  #    if !current_user.admin
  #      if current_user != @user
  #      redirect_to new_path
  #      end
  #    end
    end


private

  def destroy
  #  User.find(params[:id]).destroy
  #    redirect_to welcome_path
    end


    private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :height, :tickets, :password)
    end


end
