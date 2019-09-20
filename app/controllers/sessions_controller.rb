class SessionsController < ApplicationController
  def new

  end

  def create
    if user = User.find_by(name: params[:user][:name])
      user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path

    end
  end
end