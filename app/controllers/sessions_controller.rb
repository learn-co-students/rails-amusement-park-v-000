require 'pry'

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(id: params[:session][:user_id])
    if user && user.authenticate(params[:session][:password])
      redirect_to user_path
    else
      render 'new'
    end
  end

  def destroy
  end

end
