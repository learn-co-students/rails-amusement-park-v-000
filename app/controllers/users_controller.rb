class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
  end

  def create
    # raise params.inspect
    @user = User.create(user_params)
    # return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    redirect_to users_path(@user)
  end

  def show
    return redirect_to root_path unless logged_in?
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
  end
end
