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

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :height, :admin, :nausea, :tickets)
  end
end
