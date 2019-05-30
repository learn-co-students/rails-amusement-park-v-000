class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(params[:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
