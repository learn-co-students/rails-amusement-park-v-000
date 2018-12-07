require 'pry'

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:session][:user_id])
    if user && user.authenticate(params[:session][:password])
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Password incorrect'
      render 'new'
    end
  end

  def destroy
  end

end
