class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
    render 'new'
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/signin"
    end
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end
