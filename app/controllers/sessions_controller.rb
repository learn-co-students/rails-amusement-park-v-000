class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: params[:user][:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      render 'users/new'
    end

    redirect_to user_path(@user)
  end

  def destroy
    reset_session

    redirect_to root_path
  end
end
