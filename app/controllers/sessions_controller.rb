class SessionsController < ApplicationController
    def new 
        
    end
    
    def create 
        @user = User.find_by(id: params[:id])
        if @user && user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirects_to user_path(@user)
        else
        render 'new'
        end
    end

    def destroy

    end
end

