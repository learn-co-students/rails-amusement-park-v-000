class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    render :show
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
