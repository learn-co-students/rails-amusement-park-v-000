class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
   return head(:forbidden) unless @user.authenticate(params[:user][:password])
   session[:user_id] = @user.id
   redirect_to users_path(@user)
 end
end
