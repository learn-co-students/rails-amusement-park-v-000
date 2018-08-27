class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    render 'signin'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
