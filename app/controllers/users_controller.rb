class UsersController < ApplicationController


    def new 
       user_signup
    end
    
    def user_signup
        @user = User.new
        @user.admin = false
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end


    def mood

    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end
