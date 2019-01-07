class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permid(:name, :password, :nausea,
    :happiness, :tickets, :height, :admin)
  end
end
