class SessionController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.find(user_params[:name])
  	# if @user && user.authenticate(user_params[:password])
  	login(@user)
  	redirect_to user_path(@user)
  end

  def destroy
  	session.clear
  	redirect_to root_path
  end

  private


  def user_params
  	params.require(:user).permit(:name, :password)
  end
end
