class UsersController < ApplicationController

    def new 
        @user = User.new 
    end

    def create 
        user = User.new(user_params)
        
        if user.save 
            session[:user_id] = user.id
            redirect_to user 
        else 
            redirect_to root_url
        end
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def signin 
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
