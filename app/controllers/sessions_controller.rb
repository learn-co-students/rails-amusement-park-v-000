require 'pry'

class SessionsController < ApplicationController

  def sign_in
    @user = User.new
    render :signin
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user && @user.authenticate(params[:user.password])
      sessions[:user_id] = @user.id
      redirect_to users_path(@user)
    end
  end

end
