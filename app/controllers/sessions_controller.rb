class SessionsController < ApplicationController
  def sign_in
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:id])
    if @user && @user.authenticate(params[:user])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :'/sessions/sign_in'
    end
  end

end
