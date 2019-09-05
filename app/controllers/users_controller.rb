class UsersController < ApplicationController

  def new
  end

  def create
     @user = User.create(user_params)
     render 'new' unless @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
  end

  def show
    require_login
    @user = User.find(params[:id])
  end

    private

    def user_params
      params.require(:user).permit(:name, :password, :admin, :nausea, :happiness, :tickets, :height)
    end

    def require_login
      redirect_to '/' unless !!session[:user_id]
    end

end
