class SessionsController < ApplicationController

  def home     
  end

  def new
    @users = User.all
  end

  def create
  
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      log_in @user 
      redirect_to @user 
    else
      flash[:danger] = 'Invalid name/password combination'
      redirect_to signin_path
    end
  end


  def destroy
    log_out
    redirect_to root_path '/'
  end
  
end