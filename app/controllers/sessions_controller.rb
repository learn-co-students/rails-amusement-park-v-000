class SessionsController < ApplicationController

  def new
   @user = User.new
  end


  def create
    user_login
   end

  def destroy
	   session.delete :name
     redirect_to root_url
	end


end
