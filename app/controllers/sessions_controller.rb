class SessionsController < ApplicationController
       
    def new
       @user=User.new 
        #binding.pry
    end 
    
    def create
        @user = User.find_by(name: params[:user][:name])
         #binding.pry
        if @user  && @user.authenticate(params[:user][:password])
           
            session[:user_id] = @user.id
            redirect_to @user
        else 
            redirect_to '/login'
        end 
    end
    
    def show
        
    end 
    
    private 
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :password)
    end 
    
end
