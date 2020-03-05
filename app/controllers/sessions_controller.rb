class SessionsController < ApplicationController
    def welcome
    end
    def new
    end
    def create
        user = User.find_by(name: params[:user_name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to signin_path, notice: "No user can be found with that username."
        end
    end
    def destroy
        session.clear
        redirect_to root_path
    end
end
