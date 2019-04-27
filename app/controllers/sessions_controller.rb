class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def show
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    return head(:forbidden) unless @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
