class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to new_path
    else
      redirect_to welcome_path
    end
  end





  def destroy
    User.find(params[:id]).destroy
      redirect_to welcome_path
    end


private


  def user_params
    params.require(:user).permit(:name, :tickets, :nausea, :happiness, :height, :password, :admin)
  end

end
