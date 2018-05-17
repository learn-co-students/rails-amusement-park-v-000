class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      login(user)
      redirect_to user
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
  end
end
