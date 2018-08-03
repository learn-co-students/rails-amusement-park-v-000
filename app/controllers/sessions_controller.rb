class SessionsController < ApplicationController

# only login in and out

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user.id)
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
