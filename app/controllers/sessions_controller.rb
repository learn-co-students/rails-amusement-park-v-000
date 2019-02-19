class SessionsController < ApplicationController

  def destroy
    session.clear
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end

  end

end
