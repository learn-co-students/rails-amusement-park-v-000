class SessionsController < ApplicationController

  def new
  end


  def create
    session[:user_id] = params[:user][:name]
    if User.find(session[:user_id]) != nil
      redirect_to user_path(User.find(session[:user_id]))
    else
      redirect_to root_route
    end
  end


  def logout
    session.clear
    redirect_to root_path
  end



end
