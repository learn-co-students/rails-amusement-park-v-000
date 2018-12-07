require 'pry'
class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    binding.pry
    @user = User.new(user_params)

    if @user.save
      redirect_to @user # user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end # class UsersController
