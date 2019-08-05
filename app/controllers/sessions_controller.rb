class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find(params[:id])
        session[:user_id] = @user.id
    end

end
