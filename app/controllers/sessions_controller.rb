class SessionsController < ApplicationController
    def welcome
    end

    def new
        @user = User.new
    end 

    def create
        @user = User.find_by(name: params[:user_name])
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