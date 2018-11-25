class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def clear
    session.destroy
    redirect_to root_url
  end

end
