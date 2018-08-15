class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    end
  end

  def destroy
  session.destroy
  redirect_to '/'
end


end
