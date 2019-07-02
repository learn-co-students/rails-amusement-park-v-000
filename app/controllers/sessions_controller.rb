class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:name => params[:user][:name])
    session[:user_id] = user.id
  end
end
