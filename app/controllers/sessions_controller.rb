class SessionsController < ApplicationController

  def new
  end

  def create
    return head(:forbidden) unless user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
