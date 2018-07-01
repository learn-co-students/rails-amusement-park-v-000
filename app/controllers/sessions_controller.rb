class SessionsController < ApplicationController

  def new
  end

  def create

    if params[:user][:password].blank?

      redirect_to signin_path
    else
      @user = User.find_by(id: params[:user][:id])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end
end
