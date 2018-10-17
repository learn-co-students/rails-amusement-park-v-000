class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        signin(@user)
        redirect_to user_path(@user.id)
    end
    
    def show
        if signed_in?
            @user = current_user
        else
            redirect_to '/'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end