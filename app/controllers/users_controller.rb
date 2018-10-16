class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create # new users

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.admin = false
        redirect_to '/'
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to new_user_path
    end
  end

  def show

    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
