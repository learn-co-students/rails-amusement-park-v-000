class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:name => params[:user][:user_name])
    if @user
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

end