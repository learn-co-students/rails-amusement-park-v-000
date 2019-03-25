class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(:name => params[:user_name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
