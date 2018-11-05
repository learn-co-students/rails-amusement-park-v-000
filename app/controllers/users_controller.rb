class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def signin
  end

  def create
    user = User.find_by(params[:name])
	if user != nil
		return head(:forbidden) unless @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	else
		user = User.create(user_params)	
    		session[:user_id] = user.id
    		redirect_to user_path(user)
	end
  end


  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end

end
