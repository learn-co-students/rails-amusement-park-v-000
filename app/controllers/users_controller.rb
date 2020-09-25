class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    binding.pry
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation)
  end
end