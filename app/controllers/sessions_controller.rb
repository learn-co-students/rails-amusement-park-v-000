class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
    # binding.pry
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
# binding.pry
  end


  def destroy

  end


  def session_params(*args)
    params.require(:user).permit(:name, :password, :nausea, :height, :tickets)
  end




end
