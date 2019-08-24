class UsersController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'users/new'
        end
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to root_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end