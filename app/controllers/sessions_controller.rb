class SessionsController < ApplicationController
    # skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
  end  

  # login
  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(@user), :notice => "Welcome back, #{@user.name}!"
    else
      flash[:notice] = "try again"
      flash.now.alert = "Invalid email"
      render signin_path
    end 
  end 

  # logout
  def destroy
    session.clear
    #  or session[:user_id] = nil
    # or session.delete(:user_id)
    redirect_to root_path
  end

end


