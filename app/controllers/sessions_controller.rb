class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
      @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
        redirect_to signin_path 
      end
  end

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
    
  end


  def destroy

    session.delete :user_name

    redirect_to root_path
  end
end
