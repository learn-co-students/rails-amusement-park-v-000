class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    def create
      raise params.inspect
      @user = User.find_by(id: params[:id])
      if @user
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
