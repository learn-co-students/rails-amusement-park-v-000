class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
