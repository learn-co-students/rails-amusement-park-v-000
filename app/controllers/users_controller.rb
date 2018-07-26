class UsersController < ApplicationController

    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome!"
            redirect_to @user 
        else
            redirect_to '/users/new'
        end
    end

    def show        
          @user = User.find(params[:id])
          if session[:user_id] != @user.id
              redirect_to '/'
          end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        flash[:success] = "User Updated"
        redirect_to @user
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
