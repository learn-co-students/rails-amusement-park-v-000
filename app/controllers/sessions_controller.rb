class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/'
    end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


end
