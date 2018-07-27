class SessionsController < ApplicationController 
    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:password])    
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to users_path
        end
    end
end