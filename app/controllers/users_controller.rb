class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    raise params
  end
end
