class UsersController < ApplicationController
   before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end


  private

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :height, :tickets, :admin)
  end

end
