require 'pry'
class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find(params[:user][:id]).try(:authenticate, params[:password])
        if @user
          session[:user_id] = @user.id
          redirect_to @user
        else
          redirect_to 'sessions#new'
        end
    end

    def destroy
      session.delete :user_id
      redirect_to '/'
    end

end