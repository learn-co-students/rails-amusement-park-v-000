class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render '/application/home'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
