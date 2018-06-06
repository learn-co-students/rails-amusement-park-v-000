class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
