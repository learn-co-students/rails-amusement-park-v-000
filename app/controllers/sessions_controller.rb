class SessionsController < ApplicationController

  def new
    # render :plain => "This is the #new action controller in the sessions controller"
    # We need all the users so that we can choose one of their names from the dropdown
    @user = User.all
  end

  def create
    # render :plain => "This is the #create action controller in the sessions controller"
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sessions/new'
    end
  end

  def enter
    # render :plain => "This is where you login"
    @user = User.find_by(name: params[:user][:name])
    raise params.inspect
  end

  def destroy
    # render :plain => "This is the #destroy action controller in the sessions controller"
    session[:user_id] = nil
    redirect_to root_path
  end
end
