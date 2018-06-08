class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by
    redirect_to user_path(@user)
  end

  def destroy
  end

end
