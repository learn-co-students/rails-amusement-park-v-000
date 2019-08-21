class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
binding.pry
    @user = User.new(user_params) 
    @user.password = params[:user][:password]
      if @user.save && @user.authenticate(@user.password)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height)
  end

end
