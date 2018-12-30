class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end

end
