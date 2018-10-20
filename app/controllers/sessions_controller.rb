class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      @user = User.find_by(name: params[:user_name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end

    def destroy
      binding.pry
      session[:user_id].reset
      redirect_to root_path
    end

  end




end
