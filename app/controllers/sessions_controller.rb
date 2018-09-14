class SessionsController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end
    
    def create
        user = User.find_by(id: params[:user][:name])
        if user && user.authenticate(params[:password])
            log_in user
            redirect_to user
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    
end