class UsersController < ApplicationController
  # before_action :require_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:password,:admin)
  end
end
