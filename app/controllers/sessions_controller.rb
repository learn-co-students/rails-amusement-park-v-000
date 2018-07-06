class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create

    @user = User.find(params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
    end
    redirect_to '/'
  end


  def index
  end

  def show
  end
end
