class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to @user
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end
