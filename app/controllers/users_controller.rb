class UsersController < ApplicationController
    before_action :logged_in
    skip_before_action :logged_in, only: [:new, :create]
    
    def new
        @user=User.new
    end 
    
    def create
        @user = User.new(user_params)
        if @user.save
            #binding.pry
            session[:user_id]=@user.id
            redirect_to user_path(@user)
        else
            redirect_to '/signup'
        end 
    end 
    
    def show
        @user = User.find_by(params[:id])
        
    end 
    
    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :admin, :password)
    end 
    
    def logged_in
        if !session[:user_id]
            redirect_to '/'
        end 
    end 
end
