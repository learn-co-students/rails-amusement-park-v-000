class SessionsController < ApplicationController

  def new
    @user = User.new
    #binding.pry
  end

  def create
    #binding.pry
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
