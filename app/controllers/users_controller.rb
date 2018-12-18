class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def show
        if logged_in?
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end
        @message = params[:message] if params[:message]
        @message ||= false
    end

    def signin
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end

end