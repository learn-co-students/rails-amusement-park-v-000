class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
binding.pry
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
  end

  def show
  end


  def user_params
    params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height)
  end

end
