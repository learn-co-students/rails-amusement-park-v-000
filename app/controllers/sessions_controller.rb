class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_id(params[:user][:name])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end 