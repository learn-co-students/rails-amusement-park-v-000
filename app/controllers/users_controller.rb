class UsersController < ApplicationController
    
    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to user_path #controller: 'welcome', action: 'home'
  end

    def show
    end

    private
     
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
    
  end