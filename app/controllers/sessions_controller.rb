class SessionsController < ApplicationController
    def new 
        @user = User.new 
    end
    
    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            flash.now.alert = "Invalid email or password"
            render 'new'
        end
    end
    
    def destroy 
        reset_session
        redirect_to root_path 
    end
    
end