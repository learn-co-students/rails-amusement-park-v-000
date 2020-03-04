class UsersController < ApplicationController
    #before_action :require_login
    #skip_before_action :require_login, only: [:new, :create] 

    def index
    end 

    def new
        @user = User.new
    end 

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end 

    def show 
        user = User.find(params[:id])
        redirect_to '/' unless session[:user_id] == user.id
        @user = user
    end 

    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :happiness, :admin, :password)
    end 
 
   # def require_login
    #    return head(:forbidden) unless session.include? :user_id
   # end
    
end 