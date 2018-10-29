require 'pry'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.find_by(id: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
