class SessionsController < ApplicationController
  before_action :already_here?, except: [:destroy]

  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user_name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
  def already_here?
    redirect_to root_path if session[:user_id]
  end
end
