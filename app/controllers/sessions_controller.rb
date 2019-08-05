class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(name: params[:user][:name])
        user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end
