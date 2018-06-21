class SessionsController < ApplicationController

  def new #signin
    @user = User.new
    @users = User.all
  end

  def create #signin catch
    @user = User.find_by(name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
