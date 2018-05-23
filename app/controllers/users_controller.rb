class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
   
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
