class UsersController < ApplicationController
    #before_action :require_login
    #skip_before_action :require_login, only: [:index]

    def new
        @user = User.new
    end

    def show
        require_login
        @user = User.find_by(:id => params[:id])
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def update
        @user = User.find_by(:id => params[:id])
        redirect_to user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end

    def require_login
        redirect_to '/' unless session.include? :user_id
    end
end