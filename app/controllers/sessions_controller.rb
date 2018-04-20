class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    byebug
    @user = User.find(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  private

  def user_params
  end
end
