class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @user = User.find_by(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
