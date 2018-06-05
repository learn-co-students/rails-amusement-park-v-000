class SessionsController < ApplicationController

  # Get Sign In Page
  def new
    # NOTE : Not in demo but feel like it makes sense to build in...
    if session[:user_id]
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    end
  end

  # Post Sign In Page
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
