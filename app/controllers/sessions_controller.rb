class SessionsController < ApplicationController
    skip_before_action :login_required, :only => [:new, :create]

    def new
      @user = User.new
    end
    
    def create
        @user = User.find_by_email(params [:email])
        if user && user.authenticate(params [:password])
          session[:user_id] = @user.id
          redirect_to root_path, :notice => "Welcome back, #{user.name}"
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end 
    end
    
    def destroy
      session.clear :user_id
      redirect_to root_path
    end
end
