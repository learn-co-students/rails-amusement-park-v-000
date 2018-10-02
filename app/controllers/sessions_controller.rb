require 'pry'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_id(session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      login!
      redirect_to user_path(@user)
    else
      #message?
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
