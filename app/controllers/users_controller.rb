class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message] if params[:message]
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :password, :admin)
  end
end