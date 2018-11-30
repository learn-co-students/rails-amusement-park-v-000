class UsersController < ApplicationController
  before_action :require_logged_in, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @admin = is_admin?
      #don't have access to controller methods in view
    @user = User.find_by_id(params[:id])
    @message = params[:message] if params[:message]
    @message ||= false

  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
