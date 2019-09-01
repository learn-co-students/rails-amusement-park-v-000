class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      flash[:notice] = "User Name Already Taken."
      redirect_to new_user_path
    elsif !@user
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = current_user
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end

end
