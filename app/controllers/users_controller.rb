class UsersController < ApplicationController
  before_action :require_login, only: [:show]

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
    @user = User.find_by(id: params[:id])
    if !current_user.admin
      if current_user != @user
        redirect_to root_path
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def require_login
      redirect_to controller: 'application', action: 'home' unless logged_in?
    end
end
