class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signup'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :height, :admin)
    end
end
