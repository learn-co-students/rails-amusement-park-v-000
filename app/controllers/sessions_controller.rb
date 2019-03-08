class SessionsController < ApplicationController

  def signin
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:user.password])
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

end
