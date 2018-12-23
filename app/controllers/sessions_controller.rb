class SessionsController < ApplicationController
   
  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
    
  def new
    @user = User.new
    @users = User.all
  end

  def create
  
    @user = User.find_by(id: params[:user][:id])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
      redirect_to signin_path
    end
  end    

end