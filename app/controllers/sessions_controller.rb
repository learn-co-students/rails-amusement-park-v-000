class SessionsController < ApplicationController

  def new
   @user = User.new
  end


  def create
    user_login
  end

  def destroy
    if session[:user_id] != nil
     session.delete :user_id
    end
     redirect_to root_url
	end


end
