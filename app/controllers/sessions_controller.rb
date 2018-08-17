class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to root_path unless user
    session[:user_id] = user.id
    redirect_to user_path(session[:user_id])
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
