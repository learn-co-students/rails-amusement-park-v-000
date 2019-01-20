class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
