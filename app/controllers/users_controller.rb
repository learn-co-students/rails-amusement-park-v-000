class UsersController < ApplicationController
    before_action :require_login, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by_id(session[:user_id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

end