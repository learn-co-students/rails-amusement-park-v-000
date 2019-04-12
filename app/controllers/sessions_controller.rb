class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = 'Log in was successful.'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Log in was not successful.'
      redirect_to signin_path
    end
  end

  def destroy
    if current_user
      session.delete :user_id
    else
      redirect_to '/'
    end
  end
end