class UsersController < ApplicationController
    def show
        if User.find(params[:id]) && session[:user_id]
          @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end
end
