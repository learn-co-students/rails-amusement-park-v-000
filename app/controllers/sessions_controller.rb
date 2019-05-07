 require 'pry'
 class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by(name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render '/'
    else
      redirect_to '/users/new'
    end
  end

  def destroy
  end

end
