class SessionsController < ApplicationController
    # skip_before_action :login_required, :only => [:new, :create]

    def new
      @user = User.new
    end
    
    def create
      @user = User.find_by_name(params [:name])
      if user && user.authenticate(params [:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user), :notice => "Welcome back, #{user.name}!"
      else
        flash.now.alert = "Invalid email or password"
        render :new #or redirect 
      end 
    end
    
    def destroy
      session.clear :user_id
      #  or session[:user_id] = nil
      redirect_to root_path
    end

  private
  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin) 
  end 
end
