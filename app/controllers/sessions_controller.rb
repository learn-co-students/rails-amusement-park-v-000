class SessionsController < ApplicationController

  def new
    # render :plain => "This is the #new action controller in the sessions controller"
    @user = User.new
  end

  def create
    # render :plain => "This is the #create action controller in the sessions controller"
    @user = User.find_by_id(params[:user][:name])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sessions/new'
    end
  end

  def destroy
    # render :plain => "This is the #destroy action controller in the sessions controller"
    session[:user_id] = nil
    redirect_to root_path
  end
end
