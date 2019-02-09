class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
            render 'show'
        else
            redirect_to '/'
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/users/new'
        end
    end

    def signin
        if session[:user_id]
            redirect_to user_path(User.find(session[:user_id]))
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
