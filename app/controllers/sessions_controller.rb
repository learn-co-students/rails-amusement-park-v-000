class SessionsController < ApplicationController
  def signin
  end

  def create
    if valid_user?
      session.clear
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :signin, alert: "Oops! Something went wrong."
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def valid_user?
    !!User.find_by(name: params[:user][:name])
  end
end
