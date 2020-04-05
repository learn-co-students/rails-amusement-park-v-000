class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to root_path
        end 
    end 

    def show
        if !logged_in?
            redirect_to root_path
        end
    end 


    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end
