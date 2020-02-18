class SessionsController < ApplicationController

    def signin
        @user = User.new
    end


    def create
      @user = User.find_by(id: params[:id])
      if @user && user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'sign_in'
      end
    end

    def destroy
        reset_session
        redirect_to '/'
    end


end
