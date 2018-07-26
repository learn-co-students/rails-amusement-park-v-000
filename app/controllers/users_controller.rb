class UsersController < ApplicationController

def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
  if session[:user_id] != @user.id
    redirect_to root_url
  end
end

def create
  @user = User.create(user_params(params))
  session[:user_id] = @user.id
  redirect_to user_path(@user)
end


private

def user_params(arguements)
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
end


end
