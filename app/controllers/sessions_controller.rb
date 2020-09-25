class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    binding.pry
    @user = User.find_by(name: params[:user_name]).try(:authenticate, params[:user_password])
    @user.valid?
  end
end