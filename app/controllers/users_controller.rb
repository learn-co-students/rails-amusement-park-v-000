class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def signin
    @user = User.new
  end

  def show
    @user = User.find(session[:user_id])
  end


  private

    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
    end


end
