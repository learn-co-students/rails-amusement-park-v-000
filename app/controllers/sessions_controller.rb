class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @users = User.all
      render 'new'
    end
  end

  private

end
