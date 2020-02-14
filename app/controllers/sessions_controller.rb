class SessionsController < ApplicationController

    def new
    end

    def create
        session[:name] = params[:name]
        redirect to '/'
    end

    def destroy
        session.delete :user_id
        redirect_to controller: 'sessions', action: 'new'
    end


end
