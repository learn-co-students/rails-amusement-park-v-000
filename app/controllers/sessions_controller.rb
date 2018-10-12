class SessionsController < ApplicationController

  def logout
  end

  def create
    @user = User.find(params[:id])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

  def new
    

  end

  
end
