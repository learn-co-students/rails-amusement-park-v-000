class SessionsController < ApplicationController
  def sign_in
  end

  def log_in
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :sign_in
    end
  end

  def sign_out
    session.clear
    redirect_to root_path
  end
end
