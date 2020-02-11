class SessionsController < ApplicationController

  def signin
    @user = User.find_by(id: params[:id])
    if @user && @user.authenticate(params[user_password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render signin
    end
  end

end