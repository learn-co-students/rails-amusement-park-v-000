class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    @user = User.find_by(name: user_name)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "The password entered does not match our records"
      render '/signin'
    end
  end
end
