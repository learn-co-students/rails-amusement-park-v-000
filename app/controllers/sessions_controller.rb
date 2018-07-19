require 'pry'
class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(params[:user_name])
    if !!@user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
  end

end
