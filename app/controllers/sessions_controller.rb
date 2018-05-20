class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find(params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
