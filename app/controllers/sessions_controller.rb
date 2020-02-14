class SessionsController < ApplicationController

    def new
    end

    def create
        raise params.inspect
        return redirect_to(controller: 'sessions', action: 'new') if !params[:name] || params[:name].empty?
        session[:name] = params[:name]
        redirect to '/'
    end

    def destroy
        session.delete :name
        redirect_to controller: 'sessions', action: 'new'
    end


end
