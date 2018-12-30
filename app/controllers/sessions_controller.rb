class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:id])
    session[:name] = @user.name
    redirect_to user_path(@user)
  end

end
