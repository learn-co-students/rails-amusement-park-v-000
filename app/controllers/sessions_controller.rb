class SessionsController < ApplicationController
    def new
      @users = User.all
    end
  
    def create          
      @user = User.find(params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  
    def destroy
      session.delete :user_id
      redirect_to controller: 'application', action: 'hello'
    end
  end