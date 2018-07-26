class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        user = User.find(params[:user_name])
        if user && user.authenticate(params[:password])
            log_in user
            redirect_to user 
        else
            flash.now[:danger] = 'invalid username/password combination'
            render 'new'
        end
    end

    def destroy
        session.clear
        @user = nil
        redirect_to '/'
    end
end
