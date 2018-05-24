class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user_name])
    if !@user.nil?
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
