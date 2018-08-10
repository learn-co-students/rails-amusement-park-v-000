class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by_name(params[:user][:name])
     if @user
       session[:user_id] = @user.id
       redirect_to @user
     else
       redirect_to signin_path
     end
  end

end
