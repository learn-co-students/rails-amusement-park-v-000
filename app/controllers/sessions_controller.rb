class SessionsController < ApplicationController
  before_action :verify_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
