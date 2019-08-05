class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:session][:name])
        user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user
    end

end
