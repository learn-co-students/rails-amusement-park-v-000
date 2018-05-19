class SessionsController < ApplicationController
    
    def new
        if !current_user
            @users = User.all
        else
            flash[:notice] = "You're already logged in!"
            redirect_to '/'
        end
    end
    
    def create
        @user = User.find_by(name: params[:user_name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Incorrect login details. Please try again or sign up for an account."
            redirect_to '/signin'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end