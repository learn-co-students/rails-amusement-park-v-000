require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.admin = true if params[:admin]
        if !@user.save
          redirect_to new_user_path
        else
          session[:user_id] = @user.id
          redirect_to @user
        end
    end

    def show
        redirect_to '/' if !is_current_user?(params[:id])
        @user = User.find(params[:id])
    end
   
    private

    def user_params
        params.require(:user).permit(:name, :password, 
            :height, :happiness, :nausea, :tickets, :admin)
     end
end