class SessionsController < ApplicationController

    def new 
        @users = User.all
    end 

    def create
        @user = User.find(params[:user_name])
        if @user && @user.authenticate(params[:password])
            log_in(@user)
            redirect_to @user
        else 
        flash.now[:message] = "Unable to login."
        render :new
        end
    end 


    def destroy 
        session[:user_id] = nil

        redirect_to '/'
    end 
end
