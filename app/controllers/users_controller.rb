class UsersController < ApplicationController

  def index
    @user = User.all
  end
  def new
    @user = User.new
  end

  def create
    if (@user = User.create(user_params))
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      
    else
      render :new
    end
  end

  def show
    user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :admin, :tickets, :height)
  end
end
