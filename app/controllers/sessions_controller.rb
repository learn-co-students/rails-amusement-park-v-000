class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Username or password is incorrect."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
