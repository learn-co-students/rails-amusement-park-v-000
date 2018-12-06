class SessionsController < ApplicationController

  def signin

  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end