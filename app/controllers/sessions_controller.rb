class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    #byebug
    @user = User.find_by(name: params[:user][:name])
    #byebug
    #return head(:forbidden) unless @user.authenticate(params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
