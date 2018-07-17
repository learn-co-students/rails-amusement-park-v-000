class SessionsController < ApplicationController
  def new

  end

  def create
    if params[:user][:name].nil? || params[:user][:name].empty?
      redirect_to '/login'
    else
      session[:user_id] = params[:user][:id]
      redirect_to '/'
    end
  end

  def destroy
    session.delete :user[:name]
    redirect_to '/login'
  end

end
