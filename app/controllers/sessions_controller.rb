class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by(name: params[:name])
    #return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
end
