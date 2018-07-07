class SessionsController < ApplicationController
       
    def new
       @user=User.new 
    end 
    
    def create
        session[:user_id] = params[:user_name]
        #binding.pry
        redirect_to '/login'
    end
    
    def show
        
    end 
    
end
