class UsersController < ApplicationController 
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
    end

    def signin
        @user = User.new
    end

    def login 
    end

    private 

    def user_params 
        params.require(:user).permit(
            :name,
            :height,
            :happiness,
            :nausea,
            :tickets,
            :password
        )
    end

    def find 
        @user = User.find(params[:id])
    end
end