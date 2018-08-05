class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:users])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      flash[:notice] = "Invalid login credentials"
      redirect_to '/login'
    end
  end

  def delete
    session.destroy :user_id
    redirect_to '/'
  end

end
