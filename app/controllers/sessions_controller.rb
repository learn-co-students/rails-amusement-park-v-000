class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete(:user_id) unless session[:user_id].nil?
    redirect_to '/'
  end
end
