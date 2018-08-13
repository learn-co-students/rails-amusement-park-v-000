class SessionsController < ApplicationController

  def new
   @user = User.new
  end


  def create
  
    user_login
   end

end
