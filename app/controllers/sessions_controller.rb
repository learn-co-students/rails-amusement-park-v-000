class SessionsController < ApplicationController
    

     def destroy
       session[:user_id] = nil
       redirect_to root_url
     end

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/signin'
        end
    end
    
    
    
end