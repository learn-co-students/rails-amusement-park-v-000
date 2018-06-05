class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find
  end

  def destroy
  end
end
