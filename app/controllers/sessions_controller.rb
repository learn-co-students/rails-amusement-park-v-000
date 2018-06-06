class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(user_params[:name])
      if @user && @user.authenticate(user_params[:password])
      current_user(@user.id)
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    if current_user
      session.delete :user_id
    end
    redirect_to '/'
  end



end
