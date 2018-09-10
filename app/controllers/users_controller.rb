class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #@user.admin = true if params[:admin] == "1"
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin )
    end
end
