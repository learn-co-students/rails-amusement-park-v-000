require 'pry'
class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def show
    if current_user.nil?
      redirect_to root_url
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def create
    @user = User.new(user_params)

    @user.toggle!(:admin) if params[:user][:admin] == "1"

    if @user.save
      log_in(@user)
      redirect_to @user # user_url(@user)
    else
      render new_user_path
    end
  end

  private

    # no admin
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end # class UsersController
