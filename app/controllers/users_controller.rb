class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show 
        @user = User.find(params[:id])
        if session[:user_id] != @user.id 
            redirect_to :root
        else 
        end
    end

    def hello
    end

    def ride 
        redirect_to attractions_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
