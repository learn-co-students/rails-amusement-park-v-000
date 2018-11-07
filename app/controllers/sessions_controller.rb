class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])
    return redirect_to signin_path unless !!@user
    @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
