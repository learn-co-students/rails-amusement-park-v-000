class SessionsController < ApplicationController
  #before_action :require_signin
  def new
  end

  def create
  @user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to signin_path
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path
  end

  private

  def require_signin
    redirect_to signin_path unless session.include? :name
  end
end
