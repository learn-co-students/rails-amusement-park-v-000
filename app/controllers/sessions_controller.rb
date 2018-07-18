class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirects_to root_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
