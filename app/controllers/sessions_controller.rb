class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    session[:user_id] = @user.id
    @user = User.find_by(id: params["user"]["id"])
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to(controller: 'welcome', action: 'home')
  end

end
