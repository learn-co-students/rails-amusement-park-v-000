class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all

    @failure_message = session[:failure]
    session[:failure] = nil

    @incomplete_message = session[:incomplete]
    session[:incomplete] = nil
  end

  def create
    if !logged_in? && !sign_in_incomplete?
      @user = User.find(params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        session[:failure] = "Name and password do not match, please try again."
        render 'new'
      end
    else
      session[:incomplete] = "Failure, fill out all fields."
      render 'new'
    end
  end

  def destroy
    @current_user = nil
    session.clear

    redirect_to root_path
  end

end
