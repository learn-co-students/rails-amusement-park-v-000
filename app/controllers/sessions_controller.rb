class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(id:params["user_name"])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
