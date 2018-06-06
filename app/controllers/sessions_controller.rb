class SessionsController < ApplicationController

  # Get Sign In Page
  def new
    # NOTE : Not in demo but feel like it makes sense to build in...
    if logged_in?
      redirect_to user_path(current_user)
    end
    @users = User.all
  end

  # Post Sign In Page
  def create
    puts "Params = #{params}"
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Log in unsuccessful, would you like to sign up instead?"
      redirect_to "/signin"
    end
  end

  # Log Out Page
  def destroy
    if session[:user_id]
      session.clear
    end
    redirect_to root_path
  end

end
