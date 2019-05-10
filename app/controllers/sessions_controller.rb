class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    byebug
  end

end
