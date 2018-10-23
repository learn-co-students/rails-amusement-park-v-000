class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
     if !params[:user_name].nil? 
      @user = User.find_by(id: params[:user_name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      redirect_to '/signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
