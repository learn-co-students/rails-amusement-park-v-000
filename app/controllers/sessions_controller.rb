class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:name])
  end

  def destroy
  end


end
