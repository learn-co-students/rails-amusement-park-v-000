class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            log_in(@user)
            redirect_to user_path(@user)
        else
            @user.errors.full_messages.inspect
            render 'users/new'
        end
    end

    def show
        if logged_in?
            @user = current_user
        else
            redirect_to root_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def require_login
        unless logged_in?
            redirect_to root_url
        end
    end
end 
