class SessionsController < ApplicationController
  def new
    # Don't render sessions/new if the user is ALREADY logged in.
  end

  def create
    @user = User.find_by(name: params[:username])
    if @user.try(:authenticate, params[:password]) # Looks for nil users and incorrect passwords
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # flash[:error] = "Username and/or password are incorrect"
      # For some reason, that flash[:error] won't show up if I use #render instead of #redirect_to.
      # (Note: This is occurring before I have a drop-down list of usernames.)
      # redirect_to signin_path
      flash.now[:alert] = "Invalid username and/or password"
      render :new
    end
  end

  def destroy
  end
end
