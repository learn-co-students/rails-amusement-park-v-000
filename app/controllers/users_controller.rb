class UsersController < ApplicationController
    
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
        if @user.happiness > @user.nausea
            @mood = "happy"
        else
            @mood = "sick"
        end 
    end 
    
    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :password)
    end 
end
