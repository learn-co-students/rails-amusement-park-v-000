class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:user_name])
    return head(:forbidden) unless @user.try(:authenticate, params[:session][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
end
