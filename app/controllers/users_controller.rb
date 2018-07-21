class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user =
  end

end
