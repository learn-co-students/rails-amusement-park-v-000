class SessionsController < ApplicationController

  def index
  end

  def new
    @users = User.all
  end

  def create
      @user = User.find_by(params[:user_name])
      #byebug
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def destroy
  end

end
