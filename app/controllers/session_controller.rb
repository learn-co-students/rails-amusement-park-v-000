class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      if @user = User.find_by(name: params[:user][:name])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end
  
    def destroy
      session.delete("user_id")
      redirect_to root_path
    end
  end