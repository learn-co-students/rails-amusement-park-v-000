require 'pry'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.create(user_params)
    @user.save

    if @user.save
      @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/"
    end

  end

  def show
    #binding.pry
    @user = User.find(params[:id])
  end





  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height)
  end

end
