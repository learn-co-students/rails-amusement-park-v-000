require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if !@user.save
          redirect_to new_user_path
        else
          session[:user_id] = @user.id
          redirect_to @user
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, 
            :height, :happiness, :nausea, :tickets)
     end
end