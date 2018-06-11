class SessionsController < ApplicationController
    # skip_before_action :login_required, :only => [:new, :create]

  def new
    @user = User.new
    @users = User.all
  end  


  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)  # :notice => "Welcome back, #{@user.name}!"
    else
      flash[:notice] = "try again"
      # flash.now.alert = "Invalid email"
      render 'new' # or redirect_to signin_path
    end 
  end 

  def destroy
    session.clear
    #  or session[:user_id] = nil
    # or session.delete(:user_id) or reset_session
    redirect_to root_path
  end

private
  def sessions_params
   params.require(:user).permit(:name, :password)
   end 

end


