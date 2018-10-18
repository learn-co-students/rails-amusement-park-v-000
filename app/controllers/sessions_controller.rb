class SessionsController < ApplicationController

  def logout
    session.destroy
    redirect_to root_path
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id) 
    else
      redirect_to root_path
    end
  end

  def new

  end

  def destroy
    reset_session
    redirect_to root_path
  end
  

  
end
