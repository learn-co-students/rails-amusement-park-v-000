class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
