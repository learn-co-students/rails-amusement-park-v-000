class UsersController < ApplicationController

  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
end
