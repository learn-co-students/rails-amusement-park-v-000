class UsersController < ApplicationController 
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :signin, :index]

    def new 
        @user = User.new
    end
    
    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show 
        find
        flash[:message] = flash[:message]
    end

    def signin
        @user = User.new
    end

    def index
        @users = User.all
    end

    def signout 
        session.delete(:user_id)
        redirect_to root_path
    end

    private 

    def user_params 
        params.require(:user).permit(
            :name,
            :height,
            :happiness,
            :nausea,
            :tickets,
            :password,
            :admin
        )
    end

    def find 
        @user = User.find(params[:id])
    end

    def require_login 
        redirect_to root_path unless session[:user_id]
    end
end