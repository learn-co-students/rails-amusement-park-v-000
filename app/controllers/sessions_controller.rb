class SessionsController < ApplicationController

  def new
    render 'signin'
  end

  def create
    user = User.find_by name: params[:user][:name]
    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Please make sure you've filled all fields correctly"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
