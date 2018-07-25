class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
