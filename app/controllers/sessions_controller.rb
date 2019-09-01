class SessionsController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Incorrect name and/or password."
      redirect_to signin_path
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
