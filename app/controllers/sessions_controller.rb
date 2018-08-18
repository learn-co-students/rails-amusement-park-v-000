class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:name])

     if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render 'signin'
    end
  end

  def destroy
    # session.delete(:user_id)
    @current_user = nil
    session.clear
    redirect_to root_path
  end

end
