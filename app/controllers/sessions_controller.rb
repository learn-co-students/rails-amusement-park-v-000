class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:user_name])
    if @user.try(:authenticate, params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      return head(:forbidden)
      redirect_to '/'
    end
  end
end
