class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:user_name] = @user.name
    if @user.save
      if user_params[:admin] == "0"
        @user.save
        session[:user_id] = @user.id
          #log_in(@user)
        redirect_to @user
      elsif user_params[:admin] == "1"
        admin_signup
      end
    else
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
