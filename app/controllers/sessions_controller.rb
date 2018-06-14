class SessionsController < ApplicationController
#used for user to siginin
    def new
        @users = User.all
    end

    def create
        @user = User.find(params[:user_name])
        authenticated = @user.try(:authenticate, params[:password])
        return redirect_to signin_path unless authenticated
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end