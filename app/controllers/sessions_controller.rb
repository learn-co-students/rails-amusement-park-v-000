class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else 
        render 'sessions/new'
      end
  end


  def destroy
    reset session
    redirect_to '/'
  end
end
