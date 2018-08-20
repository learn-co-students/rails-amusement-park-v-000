class SessionsController < ApplicationController
  def new
  end

  def create
    # logs you in with the correct password
    # user has entered login info
    # check the login info (name + password) against database
    user = User.find_by(name: params[:user][:name])
    # if match, that is the user - create a session
    if user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to user_path(user.id)
    # if no match, redirect to login
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear

    redirect_to '/'
  end
end
