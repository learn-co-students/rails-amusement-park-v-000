class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def show
    if logged_in?
      render :show
    else
      flash[:alert] = "Must be logged in "
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end