class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      # redirect_to root_path
    else
      render :new
      # redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @message = params[:message] if params[:message]
    @message ||= false
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :height, :nausea, :tickets, :admin)
  end
end
