class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
  end
end