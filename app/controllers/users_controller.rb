class UsersController < ApplicationController

  def new

  end

  def create
    byebug
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end



end
