class SessionsController < ApplicationController

    def new
        @user = User.new 
    end 

    def create 
       if !params[:user_params] || parmas[:user_params].empty?
        redirect_to "users#new"
       else 
        session[:user_id] = params[:user_id]
        redirect_to "/"
       end 
    end 

    def delete
        session.destroy
        redirect_to "/"
    end

end