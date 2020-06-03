class SessionsController < ApplicationController

  def sign_in
    @user = user.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sign_in'
    end
  end
end
