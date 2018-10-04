class SessionsController < ApplicationController

  def signin
      @users = User.all
  end

  def login
    @user = User.find(params[:user_name])
      if  @user.authenticate(params[:password])
        session[:user_id]= @user.id
        redirect_to user_path(@user)
      else
        redirect_to "/"
      end
  end

    def destroy
      log_out
      redirect_to root_url
    end
end
