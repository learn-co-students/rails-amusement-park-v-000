class SessionsController < ApplicationController
  def new
    @user = User.new
    
  end

  def create
    session[:user][:name] = params[:user][:name]
    redirect_to '/users/new'
  end
end
