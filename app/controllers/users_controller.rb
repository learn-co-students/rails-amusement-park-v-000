class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :heigh, :admin)
  end

end
