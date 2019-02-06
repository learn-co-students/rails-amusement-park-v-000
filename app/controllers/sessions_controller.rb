class SessionsController < ApplicationController
  def new
    end

    def create
      @user = User.find_by(params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
          flash[:success] = "Welcome to the Amusement Park App!"
        redirect_to user_path(@user)
      else
          flash[:error] = "Welcome to the Sample App!"
        redirect_to signin_path

        #flash message
      end
    end

    def destroy
      session.delete :user_id
      redirect_to '/'
    end


end
