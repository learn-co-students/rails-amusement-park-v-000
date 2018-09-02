class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    if current_user != @user
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome to the theme park!"
    else
      render "new"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
