class SessionsController < ApplicationController
    def new
      @users = User.all
    end
  
    def create
      return redirect_to(controller: 'sessions',
                         action: 'new') if !params[:name] || params[:name].empty?           
      @user = User.find_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to controller: 'application', action: 'hello'
    end
  
    def destroy
      session.delete :user_id
      redirect_to controller: 'application', action: 'hello'
    end
  end