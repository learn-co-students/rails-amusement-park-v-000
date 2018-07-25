class SessionsController < ApplicationController

  def signin

  end

  def create

    if User.find(params[:user_name]).try(:authenticate, "#{params[:password]}")
      session[:user_id] = params[:user_name]
        @user = User.find(params[:user_name])
        redirect_to user_path(@user)

    else
        redirect_to '/'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
