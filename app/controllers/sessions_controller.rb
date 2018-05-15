class SessionsController < ApplicationController

    def new
    end

    def create 
        @user = User.find_by(name: params["user"]["name"])

        if @user 
            session[:user_id] = @user.id 
        else 
            redirect_to root_path
        end
    end
end
