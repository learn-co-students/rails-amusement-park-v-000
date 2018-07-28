class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(User.find(session[:user_id]))
    end
  end

  def create
    #raise params.inspect
    @user = User.find(params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_url
    end
  end

  def logout
    if logged_in?
      session.clear
    end
    redirect_to root_url
  end

end
