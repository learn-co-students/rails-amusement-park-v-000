class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def new 
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
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
    params.require(:user).permit(:name, :height, :happiness, :nausea, :admin, :tickets, :password, :password_confirmation )
  end
end