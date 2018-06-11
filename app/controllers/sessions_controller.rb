class SessionsController < ApplicationController
    # skip_before_action :login_required, :only => [:new, :create]

  def new
    
  end  

  # login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, :notice => "Welcome back, #{user.name}!"
    else
      flash[:notice] = "try again"
      flash.now.alert = "Invalid email"
      render :new
    end 



    # @user = User.new(params [:user])
    # if @user.save
    #   create a session 
    #   redirect user page 
    # else
    # if @user && user.authenticate(params [:password])
    #   session[:user_id] = @user.id
    #   redirect_to @user, :notice => "Welcome back, #{user.name}!"
    # else
    #   flash.now.alert = "Invalid email or password"
    #   render :new #or redirect 
    # end 
  end

  # logout
  def destroy
    session.clear
    #  or session[:user_id] = nil
    # or session.delete(:user_id)
    redirect_to root_path
  end

end
