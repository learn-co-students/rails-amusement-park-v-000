class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :nausea, :happiness, :tickets, :height, :password))
    if @user.valid?
      @user.save
      current_user(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
