class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :welcome]

def index
end

def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
  if !authorized_user?
    redirect_to '/'
  end
end



def create
  @user = User.new(user_params)
  if @user.save
    login!
    redirect_to user_path(@user)
  else
    render :new
  end
end

end

private

def user_params
  params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
end

def require_login
  redirect_to '/' if !logged_in?
end
