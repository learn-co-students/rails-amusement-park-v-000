class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find(params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        if session[:user_id] != nil
            session.delete :user_id
        end
        redirect_to root_url
    end
end
