class SessionsController < ApplicationController
  
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:user_password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else  
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
  end


end