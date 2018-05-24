class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    binding.pry
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
