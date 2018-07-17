class UsersController < ApplicationController

  before_action :user_redirect, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    session.clear
  end

    private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password)
    end

    def logged_in?
      !!session[:user_id]
    end

    def user_redirect
      if !logged_in?
        redirect_to root_path
      end
    end

end
