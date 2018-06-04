class UsersController < ApplicationController
    # before_action :authenticate, only: [:show]

    def new
        redirect_to user_path(current_user) if logged_in?
        @user = User.new
    end
    
    def create 
        @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
    end
    
    def show 
        if logged_in? 
            @user = User.find(params[:id])
        else 
            redirect_to root_path
        end
     
    end
    
    private 
    
    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end

end