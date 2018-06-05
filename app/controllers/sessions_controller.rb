class SessionsController < ApplicationController

  # Get Log In Page
  def new
  end

  # Post Log In Page
  def create
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Login unsuccessful, would you like to sign up instead?"
      redirect_to "/login"
    end
  end

  # Log Out Page
  def destroy
    if session[:user_id]
      session.clear
    end
    redirect_to '/'
  end

end
