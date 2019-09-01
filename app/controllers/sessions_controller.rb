class SessionsController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect name and/or password."
      redirect_to signin_path
    end

  end

  def destroy
    session.delete :user_id
  end

end
