class  UsersController < ApplicationController
    def home
    end
    
    def new #render signup form to create new user '/users/new'
        @user = User.new
    end

    def create #create a new user post '/users'
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(
            :name, 
            :password,
            :happiness,
            :nausea,
            :height,
            :tickets,
            :admin)
    end
end