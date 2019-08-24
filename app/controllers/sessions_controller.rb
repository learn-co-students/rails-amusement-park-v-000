class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(session[:user_id])
        else
            render 'sessions/new'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_url
    end

    private

    def login_params
        params.require(:user).permit(:name, :password)
    end

end