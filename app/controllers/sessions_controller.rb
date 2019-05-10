class SessionsController < ApplicationController

    def new
        @user = User.new
        @users = User.all
    end

    def create
        #byebug
        @user = User.find_by(id: params[:user][:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end