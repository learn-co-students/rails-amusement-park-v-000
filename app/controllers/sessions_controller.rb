class SessionsController < ApplicationController
  def new
    @user = User.new
    redirect_to '/' if in_session?
  end

  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

  def destroy
    session.delete :user_id unless session[:user_id].nil?
    redirect_to '/'
  end
end
