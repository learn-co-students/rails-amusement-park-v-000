class SessionsController < ApplicationController

  def new
  end

  def create
    user_login
    if @user
      redirect_to user_path
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to signin_path
  end

end
