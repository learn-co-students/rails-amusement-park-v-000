class SessionsController < ApplicationController
  def new
    @users = User.all
    render 'signin'
  end

  def create
    @user = User.find_by(name: params[:session][:user_name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/sessions/signin'
    end
  end
end
