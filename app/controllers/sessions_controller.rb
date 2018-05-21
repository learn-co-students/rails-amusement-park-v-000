class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user_name])

    if user && user.authenticate(params[:password])
      login(user)
      redirect_to user
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
