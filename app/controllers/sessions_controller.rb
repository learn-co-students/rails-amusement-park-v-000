require 'pry'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.find_by(id: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def logout
    if logged_in?
      session.clear
      redirect_to "/"
    else
      redirect_to new_session_path
    end
  end



  private

  def logged_in?
    !!session[:user_id]
  end

end
