class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end
  
  def create
    # binding.pry
    @user = User.find_by(name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      signin(@user)
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_path
    end
  end
  
  def destroy
      session.delete :user_id if session[:user_id]
      redirect_to '/'
  end
end