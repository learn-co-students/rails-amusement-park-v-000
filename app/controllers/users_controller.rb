class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end
