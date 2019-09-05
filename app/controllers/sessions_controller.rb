class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
   #see if session really deletes
    redirect_to '/'
  end

end
