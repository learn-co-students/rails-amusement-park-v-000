class UsersController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :home]

  def home

  end

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
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def require_login
      redirect_to root_path unless session.include? :user_id
    end
end
