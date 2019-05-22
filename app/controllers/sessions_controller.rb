class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    user = User.find_by(id: params[:user_name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
