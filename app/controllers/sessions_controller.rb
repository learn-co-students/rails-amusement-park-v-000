class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to user_path(@user)
    else
      #Error Message
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
