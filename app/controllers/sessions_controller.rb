class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    # binding.pry
    @user = User.find(params["user_name"])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
