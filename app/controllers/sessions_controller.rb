class SessionsController < ApplicationController
       
    def new
       @user=User.new 
    end 
    
    def create
        @user = User.find_by(name: params[:user][:name])
         binding.pry
        if @user  && @user.authenticate(params[:user][:password])
           
            session[:user_id] = @user.id
            redirect_to @user
        else 
            redirect_to '/login'
        end 
    end
    
    def show
        
    end 
    
end
