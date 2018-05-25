class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to user_path session[:user_id]
    end
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :password)
  end
end
