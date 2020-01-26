class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
    end
     
    def show
        @user = current_user
        if @user == nil
            redirect_to root_url
        end
    end

    private
     
    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end
end
