class UsersController < ApplicationController

    def signup
    end

    def new
        @user = User.new
        @user.admin = false
        # binding.pry
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect to @user
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
