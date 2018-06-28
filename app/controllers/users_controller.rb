class UsersController < ApplicationController
  before_action :authenticate_user, :only => :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    set_user
  end

  private

  def authenticate_user
    if !session[:user_id]
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id]) if params[:id]
  end

end
