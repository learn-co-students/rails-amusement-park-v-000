class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)


    redirect_to user_path(@user)

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
