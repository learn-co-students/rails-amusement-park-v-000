class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:user][:name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = "User not correct or not found"
        redirect_to new_user_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
