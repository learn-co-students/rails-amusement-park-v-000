class SessionsController < ApplicationController
    def new
    
      if logged_in?
        redirect_to user_path(@user)
      else
        @user = User.new
      end
    end


    def create
          @user = User.find_by(name: params[:user][:name])
          if @user &&  @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            redirect_to '/'
          end
    end

    def destroy
      session.clear
      redirect_to '/'
    end
end
