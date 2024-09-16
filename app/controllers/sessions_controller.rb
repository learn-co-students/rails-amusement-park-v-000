class SessionsController < ApplicationController

    def new
        @users = User.all
    end 

    def create
        @user = User.find_by(id: params[:user_name])
        #@user = user.try(:authenticate, params[:password])

        if !@user 
            redirect_to '/'
        else 
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        end

    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end 

end

