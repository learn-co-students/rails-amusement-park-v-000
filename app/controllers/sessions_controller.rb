class SessionsController < ApplicationController

  def sign_in
    @users = User.all #render login form
  end

  def create
    @user = User.find_by(name: params[:user_name])

    if @user && @user.authenticate(params[:user_password])
    # raise params.inspect
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'sign_in'
    end
  end

  def destroy
    if current_user
     session.delete :user_id
    end
     redirect_to '/'
    end
  end
