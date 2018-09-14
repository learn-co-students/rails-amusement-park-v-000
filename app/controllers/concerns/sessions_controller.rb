class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(:name => params[:user_name])

    if user
      session[:user_id] = user.id

      redirect_to user_path(user.id)
    else
      flash[:message] = "Username not found. Please try again."

      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end
end
