require 'pry'
class UsersController < ApplicationController
    def index
        @users = User.all 
    end 

    def new
        @user = User.new  
    end 
    
    def create 
       # binding.pry
        @user= User.create(user_params)
        session[:user_id]= @user.id
        
        if params[:user][:admin] == 1
            #redirect_to "/attractions/index"
            redirect_to "/users/#{@user.id}"
        else 
            redirect_to "/users/#{@user.id}"
        end
    end 

    def show 
        #binding.pry
            if !!session[:user_id]
                #binding.pry 
                 @user = User.find_by_id(params[:id])
            else 
                redirect_to '/'
            end
        #binding.pry
    end 

    def update 
        @ride = Ride.find_by_id(params[:id])
        #@ride.take_ride
        flash[:message] = "#{@ride.take_ride}"
        @user = @ride.user
        if @user.save 
            redirect_to @user 
        else 
            render "/attractions"
        end 
        #binding.pry
    end 

    
    private 

    def user_params 
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 
end
