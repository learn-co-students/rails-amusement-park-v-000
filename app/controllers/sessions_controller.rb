class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:alert] = "The user/password combination was not be found"
      render 'new'
    end

  end

  def destroy
    session.delete :user_id
    session[:user_id] = nil
    redirect_to root_url
  end


end
