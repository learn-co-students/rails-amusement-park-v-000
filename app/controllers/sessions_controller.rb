class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to "/"
    end


end