class UsersController < ApplicationController
    before_action :verified_user
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
       
        if @user.save
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render new_user_path 
        end
    end

    def show
       @user = User.find(params[:id])
    end

    
    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

end
