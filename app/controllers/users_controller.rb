class UsersController < ApplicationController

def new
end

def home
end

def create
	@user = User.create(user_params)
	session[:user_id] = @user.id
	redirect_to "/users/#{@user.id}"
end

def show
	if session[:user_id] == nil || session[:user_id] == ""
		redirect_to '/' 
	else
	@user = User.find(session[:user_id])
	end
end

private
 
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end
