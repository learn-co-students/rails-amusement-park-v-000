class UsersController < ApplicationController
  #index show new edit create update destroy

  include ApplicationHelper
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !current_user
  end

  def new
    @user = User.new
  end
  
  def edit
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      user_signup
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def update
  end

  def destroy
  end

  
  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end
end
