class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user][:name],
        password: params[:user][:password],
        nausea: params[:user][:nausea],
        happiness: params[:user][:hapiness],
        tickets: params[:user][:tickets],
        height: params[:user][:height],
        admin: params[:user][:admin])
    log_in(@user)
    redirect_to user_path(@user)
  end

  def show
    redirect_to '/' unless current_user
    @message = params[:message]
    @user = User.find(params[:id])
  end

  def update
    redirect_to user_path(current_user)
  end
end
