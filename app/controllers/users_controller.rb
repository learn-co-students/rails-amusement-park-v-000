class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.create(params["user"])
    @user.save
    redirect_to '/users/#{@user.id}'
  end
end
