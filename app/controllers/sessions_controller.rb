class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(:id => user_params[:name])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "User not found."
      redirect_to "/signin"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end



private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
