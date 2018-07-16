class SessionsController < ApplicationController
  
  def create
    user = User.find(params[:user][:name])
    user.try(:authenticate, params[:password])
    render :new unless user

    session[:user_id] = user.id
    redirect_to user_path(current_user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  
end