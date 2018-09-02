class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      redirect_to root_path
    end
  end
end
