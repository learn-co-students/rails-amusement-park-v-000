class SessionsController < ApplicationController

  def index
  end

  def new
    @users = User.all
  end

  def create
      @user = User.find(params[:user_name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      #byebug
      redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

end
