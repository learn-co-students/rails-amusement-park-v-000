class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      current_user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
