require 'pry'

class SessionsController < ApplicationController
  def create
    user = User.find(params[:user][:name])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to user_path user
    else
      flash.now[:danger] = 'Password incorrect'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
