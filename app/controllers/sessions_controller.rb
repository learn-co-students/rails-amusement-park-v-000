class SessionsController < ApplicationController

  def sign_in
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sign_in'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

end
