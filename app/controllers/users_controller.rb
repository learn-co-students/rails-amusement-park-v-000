class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def show 
        @user = User.find(params[:id])
        if logged_in?
            render :show
        else
            redirect_to root_path
        end
    end






    private 

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end

    def logged_in?
        session[:user_id] 
    end
end
