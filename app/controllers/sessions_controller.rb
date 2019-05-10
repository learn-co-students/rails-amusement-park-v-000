 require 'pry'
 class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
      @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
