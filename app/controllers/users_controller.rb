class UsersController < ApplicationController
  def welcome
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
