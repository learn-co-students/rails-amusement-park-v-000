class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      #if user_params[:admin] == "0"
        @user.save
        log_in(@user)
        redirect_to @user
      #elsif user_params[:admin] == "1"
      #  admin_signup
      #end
    else
      render 'new'
    end
  end

  def show
    if User.find_by_id(session[:user_id])
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
