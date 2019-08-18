class SessionsController < ApplicationController
  skip_before_action :user_verified, only: [:signin, :create]

  def signin
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear

    redirect_to '/' # root_path
  end

end
