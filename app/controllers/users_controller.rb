class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index

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
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
    if @user.nil?
      flash[:notice] = "User not found."
      redirect_to users_path

    else
      @user_message = params[:user_message] if params[:user_message]
      @user_message ||= false
      render :show
    end

  end


private


  def user_params
    params.require(:user).permit(:name, :password, :tickets, :happiness, :nausea, :height, :admin)
  end
end
