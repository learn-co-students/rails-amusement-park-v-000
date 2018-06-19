class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user.find(user_params)
  end

  def create
    @user = User.find(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
end
