class SessionsController < ApplicationController

    def new
        @users = User.all
    end

    def create
        @user = User.find_by(name: params[:user][:name])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Invalid login"
            render :new
        end
    end

    def sign_out
        session.clear
        redirect_to root_path
    end
end
