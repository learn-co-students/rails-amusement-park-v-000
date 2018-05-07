class WelcomeController < ApplicationController

  def home
    @user = current_user
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/welcome/new'
    end
  end


  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to '/'
  end


end