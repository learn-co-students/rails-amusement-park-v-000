class SessionsController < ApplicationController

    def new 
        # binding.pry
        @user = User.new
        @users = User.all

    end 

    def create 
        # binding.pry
        @user = User.find_by(name: params[:user][:name])
        # binding.pry
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          @user.save
        #   binding.pry
          redirect_to user_path(@user), notice: "Welcome back to the theme park!"
        else
          redirect_to signin_path
        end
    end 

    def destroy 
        session[:user_id] = nil
        redirect_to root_path
    end 

end
