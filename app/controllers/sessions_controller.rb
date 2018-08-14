class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end
end
